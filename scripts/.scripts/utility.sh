function am_i_at_home
{
    # At home i have my Ducky Shine 3 keyboard connected
    # so use that in order to identify if i'm at home
    usb_keyboard_entry=$(lsusb | grep -i "holtek semiconductor" | \
        awk '{print $7}')

    if [[ $usb_keyboard_entry == "Holtek" ]]
    then
        return 0
    else
        return 1
    fi
}


function is_vga_plugedin
{
    VGASTATE=$(xrandr | grep -i 'vga' | awk '{print $2 }')

    if [[ $VGASTATE == "connected" ]]; then
        return 0
    else
        return 1
    fi
}
