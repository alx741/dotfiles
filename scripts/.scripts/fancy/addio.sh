#!/bin/bash


mpc stop > /dev/null
clear
echo
echo
cat ~/.ascii_art/gnu
echo
figlet Arrivederci
echo

case "$1" in
    'halt')
        systemctl poweroff
        ;;
    'reboot')
        systemctl reboot
        ;;
esac
