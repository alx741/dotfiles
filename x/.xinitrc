# Load Xresources
xrdb -load .Xresources

# Setup monitors, sound, network (Home or No-Home)
./.scripts/setup.sh

# Disable DPMS
xset s off -dpms

# Fix Java GUI's
wmname LG3D

# Start graphical terminal emulator instance
~/.scripts/ratpoison/app_select.sh terminal

# Start Music daemon
mpd&

#{{{ Keyboard
    # Repeat rate
    xset r rate 250 50

    # Init special keys binding
    xbindkeys&

    # Set us-international-altgr keyboard
    setxkbmap us -variant altgr-intl

    # Configure keys
    setxkbmap -option ctrl:swapcaps&
    xmodmap .xmodmap&
    xcape -e 'Control_L=Escape'

    # Ibus
    export GTK_IM_MODULE=ibus
    export XMODIFIERS=@im=ibus
    export QT_IM_MODULE=ibus
    ibus-daemon -drx
#}}}

#{{{ Mouse
    # Configure appropriate laptop track pad delays and detections
    syndaemon -t -k -i 1 -d &
    synclient TapButton1=1 TapButton2=2

    # Hide the rat after 1 second
    unclutter -idle 1 -jitter 10 -root&
#}}}

# Window manager
exec ratpoison


# vim:fdm=marker
