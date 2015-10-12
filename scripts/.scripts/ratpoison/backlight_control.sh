#! /bin/sh


backlight_value=""

function get_backlight_value
{
    backlight_value=`xbacklight | sed -e 's/\..*//'`
}


function toggle
{
    # Toggle between 100% and 60%
    get_backlight_value

    if [[ $backlight_value -ne 60 && $backlight_value -ne 100 ]]
    then
        xbacklight -set 60
    fi

    if [[ $backlight_value -eq 100 ]]
    then
        xbacklight -set 60
    else
        xbacklight -set 100
    fi
}



case "$1" in
    'inc')
        xbacklight -inc 20
        ;;
    'dec')
        xbacklight -dec 20
        ;;
    'toggle')
        toggle
        ;;
esac

get_backlight_value
ratpoison -c "echo {$backlight_value}"
