#! /bin/bash

source "$(dirname "$0")/utility.sh"


if is_vga_plugedin
then
    if [[ "$1" == "dual" ]]; then
        xrandr --output LVDS-1 --mode 1366x768
        xrandr --output VGA-1 --mode 1024x768 --above LVDS-1
    elif [[ "$1" == "in" ]]; then
        xrandr --output LVDS-1 --mode 1024x768
        xrandr --output VGA-1 --same-as LVDS-1 --mode 1024x768
    else
        echo_usage
    fi
else
    if [[ "$1" == "in" ]] || [[ "$1" == "dual" ]]; then
        echo
        echo "[!] VGA not connected"
        echo
    elif [[ "$1" == "out" ]]; then
        xrandr --output LVDS-1 --mode 1366x768
        xrandr --output VGA-1 --off
    fi
fi

function echo_usage
{
    echo
    echo  in    - mirror to VGA
    echo  dual  - independent VGA and LVDS-1
    echo  out   - back to normal
    echo
}

sleep 0.5
ratpoison -c "restart"
