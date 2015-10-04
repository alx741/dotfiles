#! /bin/sh


case "$1" in
    '+')
        amixer set Master 5%+
        ;;
    '-')
        amixer set Master 5%-
        ;;
    'm')
        amixer set Master toggle
        ;;
esac

ratpoison -c "echo $( ~/.scripts/info.sh )"
