#! /bin/sh


case "$1" in
    'inc')
        amixer set Master 5%+
        ;;
    'dec')
        amixer set Master 5%-
        ;;
    'mute')
        amixer set Master toggle
        ;;
    'high')
        amixer set Master 100%
        ;;
    'low')
        amixer set Master 15%
        ;;
esac

ratpoison -c "echo ($(~/.scripts/echo_volume.sh))"
