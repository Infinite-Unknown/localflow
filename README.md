# LocalFlow

**Voice to text for your Mac. 100% on-device. Nothing you say ever leaves your computer.**

Hold a key, speak, release. LocalFlow types clean, polished text into whatever
app you're using: it removes filler words, applies your self-corrections
("tmr 10am meeting, wait no 2pm" becomes "Tomorrow 2pm meeting."), fixes
punctuation, and can even translate as you speak.

<p align="center"><img src="assets/protogen-transparent.png" width="220"></p>

## What it does

- **Dictate anywhere** - hold your hotkey (or toggle it), speak, and cleaned
  text lands where your cursor is. Any key can be the hotkey.
- **Two modes** - *Translator* cleans up what you say; *Assistant* answers
  what you ask and types the reply instead.
- **Record meetings and classes** - live transcript with speakers separated
  as they talk, then an accurate speaker-labeled transcript. Voices are
  recognized automatically across meetings: rename "Speaker 1" to a real
  name once and it sticks.
- **Speak multiple languages** - pick the languages you use, or auto-detect.
  Optionally translate everything you dictate into one output language.
- **Your dictionary** - names, jargon, and brands are transcribed and spelled
  the way you want.
- **Yours to tune** - light/dark theme, sounds, a customizable voice
  visualizer, Dock or menu-bar-only.

## Private by design

Speech recognition (Whisper), the language model (via MLX), and speaker
recognition all run on your Mac's own silicon. No accounts, no cloud, no
telemetry. Prefer a server you already run (Ollama, LM Studio) or a cloud API?
Point the Language Model engine at any OpenAI-compatible endpoint - your call.

## Install

Requirements: Apple Silicon Mac (M1 or newer), macOS 13+.

**[Download the latest installer](https://github.com/Infinite-Unknown/localflow/releases/latest)** -
grab the `.pkg` from the release page and double-click it. LocalFlow launches
by itself when the installer finishes, and later updates are one click in the
app's **About** tab.

> **"Apple could not verify... free of malware"?** Don't worry, nothing is
> wrong. macOS shows this for any app that isn't signed with an Apple
> Developer ID ($99/year), which independent apps distributed outside the
> App Store often skip. To install anyway:
>
> 1. Double-click the `.pkg`. When the warning appears, click **Done**
>    (not "Move to Trash").
> 2. Open **System Settings > Privacy & Security** and scroll down: you'll
>    see *"LocalFlow-x.y.z.pkg" was blocked to protect your Mac*.
> 3. Click **Open Anyway**, confirm, and enter your password. The installer
>    opens and runs normally.
>
> On older macOS versions, Control-clicking the `.pkg` and choosing **Open**
> also works.

On first launch, LocalFlow checks your Mac's memory and recommends the right
models for it (from ~1 GB for an 8 GB Air to bigger, smarter models for pro
machines). One click downloads them; after that everything is offline. You can
switch models anytime in the **Models** tab.

macOS will ask for Microphone, Accessibility, and Input Monitoring on first
use - each is required for dictation to hear you and type for you.

## Uninstall

The uninstaller removes everything LocalFlow put on your Mac - the app, its
settings, virtual environment, and speaker profiles - and asks first whether
to keep your meeting recordings (kept ones move to your Desktop):

```sh
bash /Applications/LocalFlow.app/Contents/Resources/uninstall.sh
```

The same script is in this repo at [scripts/uninstall.sh](scripts/uninstall.sh)
if you'd like to read it first. Downloaded models live in the shared Hugging
Face cache (`~/.cache/huggingface`); delete that folder too if nothing else
uses it.

## The models

| Tier | Speech | Language | Fits |
|---|---|---|---|
| Light | Whisper Base | Llama 3.2 1B | 8 GB Macs |
| Balanced | Whisper Small | Qwen3 4B | 16 GB Macs |
| Full | Whisper Turbo | Qwen3 4B / Qwen2.5 7B / Qwen3 14B | 32 GB+ |

Import your own MLX models, or use any OpenAI-compatible API.

---

LocalFlow is proprietary software. All rights reserved.
This repository hosts releases, install and uninstall resources; the source
code is not published.
