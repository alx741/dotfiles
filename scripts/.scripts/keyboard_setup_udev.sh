#!/bin/bash

export HOME=/home/alx
export XAUTHORITY=$HOME/.Xauthority
export DISPLAY=:0

/usr/bin/su alx -c "$HOME/.scripts/keyboard_setup_x.sh"&
