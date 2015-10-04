#! /bin/sh


case "$1" in
    '+')
        xbacklight -inc 20
        ;;
    '-')
        xbacklight -dec 20
        ;;
esac

ratpoison -c "echo $(xbacklight | sed -e 's/\..*//')"
