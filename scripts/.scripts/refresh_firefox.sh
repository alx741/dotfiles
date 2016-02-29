#!/bin/sh

WID=`xdotool search --name "Mozilla Firefox" | head -1`
xdotool key --window "$WID" ctrl+r
