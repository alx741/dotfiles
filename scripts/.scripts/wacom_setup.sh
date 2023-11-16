#!/bin/sh

WACOM_PEN="Wacom Intuos S Pen stylus"
WACOM_PAD="Wacom Intuos S Pad pad"
MAIN_SCREEN="DisplayPort-1"

xsetwacom set "$WACOM_PEN" MapToOutput "$MAIN_SCREEN"
xsetwacom set 10 Area 0 0 15200 8550  # 1920x1080 screen aspect ratio
xsetwacom set "$WACOM_PEN" Button 2 2
xsetwacom set "$WACOM_PEN" Button 3 3

xsetwacom set "$WACOM_PAD" Button 1 "key +ctrl z -ctrl"
xsetwacom set "$WACOM_PAD" Button 2 "key +ctrl +shift z -ctrl -shift"
xsetwacom set "$WACOM_PAD" Button 3 "key +ctrl 0 -ctrl"
xsetwacom set "$WACOM_PAD" Button 8 "key m"

xsetwacom set "$WACOM_PEN" PressureCurve 0 0 70 100
