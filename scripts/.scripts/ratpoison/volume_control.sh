#! /bin/sh

source "$(dirname "$0")/../volume.sh"


function read_volume_value
{
    vol_level=`ratpoison -c "prompt volume? "`

    if [[ $vol_level -le 100 && $vol_level -ge 0 ]]
    then
        amixer set Master $vol_level%
    fi
}


function print_ratposion
{
    ratpoison -c "echo ($(vol_echo_formatted ))"
}


function print_tmux
{
    tmux refresh-client -S
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
    'get_mode')
        echo $(vol_get_mode)
        exit 0
        ;;
    'set_music_mode')
        $(vol_set_music_mode)
        print_tmux
        exit 0
        ;;
    'set_normal_mode')
        $(vol_set_normal_mode)
        print_tmux
        exit 0
        ;;
    'set')
        amixer set Master $2%
        print_tmux
        exit 0
        ;;
esac

print_ratposion
print_tmux
