#!/bin/bash
# Cleanly remove LocalFlow from this Mac. Asks before touching recordings.
# Wrapped in main() so bash reads the whole script before we delete the app
# bundle this file may live inside.
main() {
    APP="/Applications/LocalFlow.app"
    DATA="$HOME/Library/Application Support/localflow"

    echo "This removes LocalFlow: the app, its settings, virtual environment,"
    echo "and speaker profiles. You will be asked about meeting recordings."
    read -r -p "Continue? [y/N] " a
    [[ "$a" == [yY]* ]] || exit 0

    pkill -f "Application Support/localflow" 2>/dev/null || true
    osascript -e 'tell application "System Events" to delete login item "LocalFlow"' \
        >/dev/null 2>&1 || true

    if [ -n "$(ls -A "$DATA/meetings" 2>/dev/null)" ]; then
        read -r -p "Keep your meeting recordings and transcripts? [Y/n] " m
        if [[ "$m" != [nN]* ]]; then
            DEST="$HOME/Desktop/LocalFlow Meetings"
            i=2
            while [ -e "$DEST" ]; do DEST="$HOME/Desktop/LocalFlow Meetings $i"; i=$((i + 1)); done
            mv "$DATA/meetings" "$DEST"
            echo "Recordings moved to: $DEST"
        fi
    fi

    rm -rf "$DATA"
    rm -f "$HOME/Library/Logs/localflow.log"
    if [ -d "$APP" ]; then
        # .pkg installs are root-owned; ask for the password only when needed
        rm -rf "$APP" 2>/dev/null || sudo rm -rf "$APP"
    fi
    if pkgutil --pkg-info com.infinite.localflow >/dev/null 2>&1; then
        sudo pkgutil --forget com.infinite.localflow >/dev/null || true
    fi
    echo "LocalFlow removed."
    echo "Downloaded models stay in the shared cache at ~/.cache/huggingface;"
    echo "delete that folder too if nothing else on your Mac uses it."
}
main "$@"
