#!/bin/bash

window_list=$(ratpoison -c "windows")
window=$(echo -e "$window_list" | sed 's/URxvt/urxvt terminal/' | rofi -dmenu -i -p "" -no-custom)

if [[ "$window" != "" ]];
then
    number=$(echo $window | head -c 1)
    ratpoison -c "select $number"
fi
