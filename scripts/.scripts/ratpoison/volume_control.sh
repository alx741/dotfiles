#! /bin/sh


function read_volume_value
{
    vol_level=`ratpoison -c "prompt volume? "`

    if [[ $vol_level -le 100 && $vol_level -ge 0 ]]
    then
        amixer set Master $vol_level%
    fi
}


amixer set PCM 100%

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
    'medium')
        amixer set Master 50%
        ;;
    'ask')
        read_volume_value
        ;;
esac

ratpoison -c "echo ($(~/.scripts/echo_volume.sh))"
tmux refresh-client -S
