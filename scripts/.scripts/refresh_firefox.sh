#!/bin/sh

# Focus lolcahost tab
if [[ "$1" == "focus" ]]; then
    $($HOME/.scripts/ratpoison/firefox.sh "focus_tab" "localhost")
fi

# Refresh
WID=$(xdotool search --name "Mozilla Firefox" | head -1)
xdotool key --window "$WID" ctrl+r
