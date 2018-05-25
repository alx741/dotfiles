function is_vga_plugedin
{
    VGASTATE=$(xrandr | grep -i 'vga' | awk '{print $2 }')

    if [[ $VGASTATE == "connected" ]]; then
        return 0
    else
        return 1
    fi
}


function is_hdmi_plugedin
{
    VGASTATE=$(xrandr | grep -i 'hdmi' | awk '{print $2 }')

    if [[ $VGASTATE == "connected" ]]; then
        return 0
    else
        return 1
    fi
}

function am_i_at_home
{
    # Both VGA and HDMI ports are hooked in
    if is_vga_plugedin && is_hdmi_plugedin
    then
        return 0
    else
        return 1
    fi
}
