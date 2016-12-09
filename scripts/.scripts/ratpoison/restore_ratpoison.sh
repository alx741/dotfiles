#!/bin/bash

# Openbox is used as alternative window manager, get rid of it properly
# and restart ratpoison

killall openbox
killall xmonad
sleep 1
ratpoison -c restart
