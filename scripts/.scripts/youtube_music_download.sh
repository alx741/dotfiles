#! /bin/sh


MUSIC_DIR=~/music
TMP_FILE=/tmp/youtube-dl.temp
TMP_FINAL_FILE=/tmp/youtube-dl.mp3
URL=""

echo
cat ~/.ascii_art/music
echo

if [[ "$1" == "" ]]
then
    echo
    echo "No URL supplied, trying with the clipboard current selection: "
    URL=`xclip -selection clipboard -o`
    echo "  $URL"
    echo
else
    URL="$1"
fi

youtube-dl --no-warnings -x --audio-format mp3 -o "$TMP_FILE" "$URL"

if [[ $? -ne 0 ]]
then
    echo
    echo "[!] Bad URL"
    echo
    echo "Usage: $0 URL"
    echo "If no URL is supplied the current X clipboard selection is used"
    exit 1
fi

vid_title=`youtube-dl -q --no-warnings -e "$URL"`
default_artist=$(echo "$vid_title" | cut -d "-" -f1 | sed 's/ $//')
default_title=$(echo "$vid_title" | cut -d "-" -f2 | sed 's/^ //;s/\[.*\]//;s/(.*)//;s/ $//')

read -p "Artist? [$default_artist] " artist
read -p "Title? [$default_title] " title
read -p "Album? [none] " album
read -p "Comment? [none] " comment

if [[ "$artist" == "" ]]; then artist="$default_artist"; fi
if [[ "$title" == "" ]]; then title="$default_title"; fi
if [[ "$album" == "" ]]; then album=" "; fi
if [[ "$comment" == "" ]]; then comment=" "; fi
id3v2 -t "$title" -a "$artist" -A "$album" -c "$comment" "$TMP_FINAL_FILE"

mv "$TMP_FINAL_FILE" "$MUSIC_DIR/$artist-$title.mp3"
mpc update
