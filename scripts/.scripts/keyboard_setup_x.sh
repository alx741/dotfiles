#!/bin/sh

# Separate from main keyboard_setup as this needs to be executed on udev re-enumeration

setxkbmap us -variant altgr-intl
xset r rate 200 50
