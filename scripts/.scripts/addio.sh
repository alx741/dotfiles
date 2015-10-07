#!/bin/bash


function destructor
{
    mpc stop > /dev/null
    figlet Arrivederci
    echo
    echo
}


clear
echo
cat ~/.ascii_art/gnu
echo

read -n1 -r -p "Are you leaving? [p/r]" key


if [ "$key" = 'p' ]; then
    destructor
    systemctl poweroff
elif [ "$key" = 'r' ]; then
    destructor
    systemctl reboot
else
    clear
    exit 0
fi
