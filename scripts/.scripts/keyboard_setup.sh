#!/bin/sh

builtin_id=$(xinput -list | grep -i 'AT Translated' | grep -oh 'id=[0-9]*' | cut -d'=' -f 2)
venabili_id=$(xinput -list | grep -i 'Venabili' | tail -n 1 | grep -oh 'id=[0-9]*' | cut -d'=' -f 2)

echo "$builtin_id"
echo "$venabili_id"

# Repeat rate
xset r rate 200 50

# Init special keys binding
xbindkeys&

# Set us-international-altgr keyboard
setxkbmap us -variant altgr-intl

# Configure keys
setxkbmap -device "$builtin_id" -option ctrl:swapcaps&
# xmodmap ~/.xmodmap&
killall xcape
xcape -t 250 -e 'Control_L=Escape'
xcape -e 'Super_L=Control_L|G|bracketleft'
xcape -e 'Super_R=Control_R|G|bracketright'
