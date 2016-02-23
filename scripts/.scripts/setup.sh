#! /bin/sh

source "$(dirname "$0")/utility.sh"

# Auto setup configuration script
# [!] Execute this AFTER ratpoison

# 2 different setups are available:
#
# * Home
#       - Laptop display off
#       - LCD (HDMI) monitor [1360x768]
#       - LCD (VGA) monitor [1024x768]
#       - HDMI left of VGA
#       - No display power saving
#       - Sound unmute
#       - Ethernet static configuration
#       - Init:
#           - Web browser
#
# * No-Home
#       - Laptop display [1366x768]
#       - LCD (VGA) monitor [1024x768] (if any)
#       - Laptop below LCD monitor (if any)
#       - Display power saving
#       - Sound mute
#       - Ethernet dhcp client


if am_i_at_home
then
    xrandr --output LVDS1 --off
    xrandr --output HDMI1 --mode 1360x768
    xrandr --output VGA1 --mode 1366x768 --left-of HDMI1
    xbacklight -set 0
    amixer set Master unmute
    amixer set Master 100%
    ~/.scripts/network/configure_ether.sh
    firefox&
else
    if is_vga_plugedin
    then
        xrandr --output LVDS1 --mode 1366x768 --below VGA1
        xrandr --output VGA1 --mode 1024x768 --above LVDS1
    fi
    xbacklight -set 100
    amixer set Master 0%
    amixer set Master mute
    dhclient enp3s0&
fi
