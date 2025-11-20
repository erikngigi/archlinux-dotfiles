#!/bin/bash
#
# batch_set_titles.sh - Set MKV title metadata based on filename (without extension)
#
# Usage:
#   ./batch_set_titles.sh
#   (processes all *.mkv files in the current directory)

set -euo pipefail
shopt -s nullglob

for FILE in *.mkv; do
    BASENAME="${FILE%.*}"   # strip extension
    echo "🎬 Setting title of '$FILE' to '$BASENAME'..."
    mkvpropedit "$FILE" --edit info --set "title=$BASENAME"
done

echo "✅ All MKV titles updated."
