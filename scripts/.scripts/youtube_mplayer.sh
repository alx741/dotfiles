#! /bin/sh


URL=""
COOKIE_FILE=/tmp/youtube_cookie

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

video_uri=`youtube-dl -g --cookies "$COOKIE_FILE" "$URL"`
# Use specific video+audio codecs
# video_uri=`youtube-dl -gf 244/243/242/135/134/133/43/5+140/171/251 --cookies "$COOKIE_FILE" "$URL"`
if [[ $? -ne 0 ]]
then
    echo
    echo "[!] Bad URL"
    echo
    echo "Usage: $0 URL"
    echo "If no URL is supplied the current X clipboard selection is used"
    exit 1
fi

mplayer -cookies -cookies-file "$COOKIE_FILE" "$video_uri"
