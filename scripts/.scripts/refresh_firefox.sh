#!/bin/sh

# Focus Firefox
$($HOME/.scripts/ratpoison/app_select.sh "firefox")

# Refresh
WID=$(xdotool search --name "Mozilla Firefox" | head -1)
xdotool key --window "$WID" ctrl+r

# Focus Urxvt
$($HOME/.scripts/ratpoison/app_select.sh "terminal")
