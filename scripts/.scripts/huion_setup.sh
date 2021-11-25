#!/bin/sh

## Requires Digimend: digimend-drivers-git-dkms (AUR)

HUION_PEN="HUION Huion Tablet stylus"
HUION_PAD="HUION Huion Tablet Pad pad"
HUION_STRIP="HUION Huion Tablet Touch Strip pad"
MAIN_SCREEN="DisplayPort-1"

xsetwacom set "$HUION_PEN" MapToOutput "DisplayPort-1"
xsetwacom set "$HUION_PEN" Button 2 2
xsetwacom set "$HUION_PEN" Button 3 "Button 3"
xsetwacom set "$HUION_PEN" Area 0 0 55880 31433  # 1920x1080 screen aspect ratio
xsetwacom set "$HUION_PEN" PressureCurve 0 0 60 100

xsetwacom set "$HUION_PAD" Button 1  "key +ctrl 0 -ctrl"
xsetwacom set "$HUION_PAD" Button 2  "key +ctrl"
xsetwacom set "$HUION_PAD" Button 3  "key +shift"
xsetwacom set "$HUION_PAD" Button 8  "key +ctrl +shift R -shift -ctrl"
xsetwacom set "$HUION_PAD" Button 9  "key +ctrl z -ctrl"
xsetwacom set "$HUION_PAD" Button 10 "key +ctrl y -ctrl"
xsetwacom set "$HUION_PAD" Button 11 "key +v"

xsetwacom set "$HUION_STRIP" Suppress 0
xsetwacom set "$HUION_STRIP" AbsWheelDown "button 4 4"
xsetwacom set "$HUION_STRIP" AbsWheelUp   "button 5 5"
