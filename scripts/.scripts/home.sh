#! /bin/bash

# Toggle laptop between:
#
# Setup 1:
#       External monitors
#       Ethernet connection
#
# Setup 2:
#       Laptop monitor
#       Wifi connection

source "$(dirname "$0")/utility.sh"

if [[ "$1" == "out" ]];
then
    ~/.scripts/network/wifi.sh
    xrandr --output LVDS1 --mode 1366x768
    xrandr --output HDMI1 --off
    xrandr --output VGA1 --off
    xbacklight -set 100
    ratpoison -c "restart"
elif [[ "$1" == "in" ]];
then
    if am_i_at_home
    then
        sudo ifconfig wlp2s0 down
        xrandr --output LVDS1 --off
        xrandr --output HDMI1 --mode 1360x768
        xrandr --output VGA1 --mode 1366x768 --left-of HDMI1
        xbacklight -set 0
        amixer set Master unmute
        amixer set Master 100%
        ~/.scripts/network/ether.sh
        ratpoison -c "restart"
    else
        echo
        echo "Engage first!"
        echo
    fi
else
    echo
    echo "$0 [in/out]"
    echo
fi
