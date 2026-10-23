#!/usr/bin/env bash
set -euo pipefail
DEST="${CODEX_HOME:-$HOME/.codex}/skills"
mkdir -p "$DEST"
for skill in skills/*; do
  [ -d "$skill" ] || continue
  name="$(basename "$skill")"
  target="$DEST/$name"
  if [ -e "$target" ]; then
    echo "Skipping $name: already exists at $target"
  else
    cp -R "$skill" "$target"
    echo "Installed $name"
  fi
done
echo "Restart Codex to pick up new skills."
