#!/usr/bin/env bash

set -uo pipefail

OUTDIR="${1:-$HOME/Music/yt-audio}"

mkdir -p "$OUTDIR"

echo "Saving audio files to: $OUTDIR"
echo "Enter a YouTube video or playlist URL and press Enter to download."
echo "Playlists are downloaded in full and placed in their own subfolder."
echo "Leave blank (just press Enter) or type 'q'/'quit' to exit."
echo

while true; do
    read -rp "YouTube URL: " URL

    if [[ -z "$URL" || "$URL" == "q" || "$URL" == "quit" ]]; then
        echo "Exiting."
        break
    fi

    if [[ "$URL" == *"list="* || "$URL" == *"/playlist"* ]]; then
        echo "Playlist detected downloading all items..."
        OUTPUT_TEMPLATE="$OUTDIR/%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s"
        PLAYLIST_FLAGS=(--yes-playlist)
    else
        OUTPUT_TEMPLATE="$OUTDIR/%(title)s.%(ext)s"
        PLAYLIST_FLAGS=(--no-playlist)
    fi

    yt-dlp \
        -x \
        --audio-format vorbis \
        --audio-quality 0 \
        "${PLAYLIST_FLAGS[@]}" \
        --ignore-errors \
        -o "$OUTPUT_TEMPLATE" \
        "$URL"

    if [[ $? -eq 0 ]]; then
        echo "✓ Done."
    else
        echo "✗ Something went wrong (or some items failed) check above."
    fi
    echo
done
