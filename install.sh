#!/bin/bash
# Installs the `watch` command and the Claude Code skill. Needs: python3, ffmpeg.
set -e
command -v ffmpeg >/dev/null || { echo "Install ffmpeg first (macOS: brew install ffmpeg)"; exit 1; }
H="$HOME/.claude/watch"; mkdir -p "$H" "$HOME/.claude/skills/watch"
python3 -m venv "$H/venv"
"$H/venv/bin/pip" install -q yt-dlp pillow faster-whisper
cp "$(dirname "$0")/watch.py" "$H/watch.py"
printf '#!/bin/bash\nexec /usr/bin/env python3 "$HOME/.claude/watch/watch.py" "$@"\n' > "$H/watch"; chmod +x "$H/watch"
cp "$(dirname "$0")/skill/SKILL.md" "$HOME/.claude/skills/watch/SKILL.md"
mkdir -p "$HOME/.local/bin"; ln -sf "$H/watch" "$HOME/.local/bin/watch"
echo "Done. Restart Claude Code, then paste a reel link and say: watch this"
echo "Make sure ~/.local/bin is on your PATH."
