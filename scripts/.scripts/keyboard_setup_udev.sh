#!/bin/sh

export HOME=/home/alx
export XAUTHORITY=$HOME/.Xauthority
export DISPLAY=:0

/usr/bin/su alx -c "setxkbmap us -variant altgr-intl; xset r rate 200 50"&
