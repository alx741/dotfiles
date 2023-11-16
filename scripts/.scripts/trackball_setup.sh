#!/bin/sh

trackball_name="Kensington Expert Wireless TB Mouse"
trackball_id=$(xinput | grep "$trackball_name" | sed 's/^.*id=\([0-9]*\)[ \t].*$/\1/')

# Enable acceleration
xinput set-prop $trackball_id "libinput Accel Speed" -0.5
xinput set-prop $trackball_id "libinput Accel Profile Enabled" 0, 0

# Ball scrolling
xinput set-prop $trackball_id "libinput Scroll Method Enabled" 0, 0, 1

# Ramap buttons
xinput set-button-map $trackball_id 1 8 3 4 5 6 7 2 9
xinput set-prop $trackball_id "libinput Button Scrolling Button" 3
