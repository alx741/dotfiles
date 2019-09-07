# Load Xresources
xrdb -load .Xresources

# Setup monitors, sound, network (Home or No-Home)
./.scripts/setup.sh

# Disable DPMS
xset s off -dpms

# Fix Java GUI's
wmname LG3D

# Start Music daemon
mpd&

#{{{ Mouse
    # Configure appropriate laptop track pad delays and detections
    syndaemon -t -k -i 1 -d &
    synclient TapButton1=1 TapButton2=2 FingerHigh=50 FingerLow=30

    # Hide the rat after 1 second
    unclutter -idle 1 -jitter 10 -root&

    # Left pointer
    xsetroot -cursor_name left_ptr
#}}}

# Window manager
exec ratpoison

# Keyboard
./.scripts/keyboard_setup.sh


# vim:fdm=marker
