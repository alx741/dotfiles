#!/bin/bash


clear
echo
echo
cat ~/.ascii_art/gnu
echo
figlet Arrivederci
echo

case "$1" in
    'halt')
        poweroff
        ;;
    'reboot')
        reboot
        ;;
esac
