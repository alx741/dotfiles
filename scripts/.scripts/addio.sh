#!/bin/bash

echo
cat ~/.ascii_art/gnu
echo

read -n1 -r -p "Are you leaving? [p/r]" key


if [ "$key" = 'p' ]; then
    toilet -f smblock Arrivederci
    echo
    echo
    systemctl poweroff
elif [ "$key" = 'r' ]; then
    toilet -f smblock Arrivederci
    echo
    echo
    systemctl reboot
else
    clear
    exit 0
fi
