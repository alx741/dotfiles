function is_vga_plugedin
{
    VGASTATE=$(xrandr | grep -i 'DP1' | awk '{print $2 }' | head -n 1)

    if [[ $VGASTATE == "connected" ]]; then
        return 0
    else
        return 1
    fi
}


function is_hdmi_plugedin
{
    VGASTATE=$(xrandr | grep -i 'DP2-1' | awk '{print $2 }' | head -n 1)

    if [[ $VGASTATE == "connected" ]]; then
        return 0
    else
        return 1
    fi
}

function am_i_at_home
{
    # Both VGA and HDMI ports are hooked in
    # TODO: reimplement this
    return 0
    #if is_vga_plugedin && is_hdmi_plugedin
    #then
    #    return 0
    #else
    #    return 1
    #fi
}
