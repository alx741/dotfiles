#!/bin/bash


clear
echo
echo
echo
cat ~/.ascii_art/gnu
echo
figlet Arrivederci
echo
if [[ "$1" == "halt" ]]
then
    sudo poweroff
else
    sudo reboot
fi
