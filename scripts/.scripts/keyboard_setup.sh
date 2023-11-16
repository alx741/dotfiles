#!/bin/sh

# builtin_id=$(xinput -list | grep -i 'AT Translated' | grep -oh 'id=[0-9]*' | cut -d'=' -f 2)
# venabili_id=$(xinput -list | grep -i 'Venabili' | tail -n 1 | grep -oh 'id=[0-9]*' | cut -d'=' -f 2)

# $(dirname "$0")/keyboard_setup_udev.sh
setxkbmap us -variant altgr-intl
xset r rate 200 50
killall xbindkeys xcape 2&> /dev/null
xbindkeys&
xcape -e 'Super_L=Control_L|G|bracketleft'&
xcape -e 'Super_R=Control_R|G|bracketright'&
# xmodmap ~/.xmodmap&

# Host has builtin keyboard
# if [ ! -z "$builtin_id" ];
# then
#     setxkbmap -device "$builtin_id" -option ctrl:swapcaps&
#     setxkbmap -option ctrl:swapcaps&
#     xcape -t 250 -e 'Control_L=Escape'
# fi
