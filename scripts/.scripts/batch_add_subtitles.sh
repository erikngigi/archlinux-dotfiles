#!/bin/bash
#
# batch_add_subtitles.sh - Merge matching SRT subtitles into MKV files as English default
#
# Usage:
#   ./batch_add_subtitles.sh
#   (scans current directory for *.mkv with matching *.srt)

set -euo pipefail

shopt -s nullglob

for VIDEO in *.mkv; do
	BASENAME="${VIDEO%.*}"
	SUBS="${BASENAME}.srt"

	if [ -f "$SUBS" ]; then
		echo "🔍 Found match: $VIDEO + $SUBS"

		TEMP_OUTPUT="$(mktemp --suffix=.mkv)"

		mkvmerge -o "$TEMP_OUTPUT" \
			"$VIDEO" \
			--language 0:eng --default-track 0:yes "$SUBS"

		mv -f "$TEMP_OUTPUT" "$VIDEO"
		echo "✅ Subtitles from '$SUBS' merged into '$VIDEO'"
	else
		echo "⚠️  No subtitles found for $VIDEO (skipped)"
	fi
done
