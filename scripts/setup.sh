#! /bin/sh

# Auto setup configuration script
# [!] Execute this AFTER ratpoison

# 2 different setups are available:
#
# * Home
#       - Laptop display [1366x768]
#       - LCD (VGA) monitor [1024x768]
#       - Laptop above LCD monitor
#       - Sound available
#       - Init:
#           - Terminal emulator
#           - Web explorer
#
# * No-Home
#       - Laptop display [1366x768]
#       - Sound mute
#       - Init:
#           - Terminal emulator



# Return TRUE if VGA is connected
#
# VGA plugedin: Home
# VGA NO plugedin: No-Home
vga_plugedin()
{
    VGASTATE=$(xrandr | grep -i 'vga' | awk '{print $2 }')

    if [[ $VGASTATE == "connected" ]]; then
        return 0
    else
        return 1
    fi
}


# Home setup
if vga_plugedin; then
    xrandr --output VGA1 --mode 1024x768
    xrandr --output LVDS1 --mode 1024x768 --above VGA1
    amixer set Master unmute

    firefox&

# No-Home setup
else
    xrandr --output LVDS1 --mode 1366x768
    amixer set Master mute
fi
