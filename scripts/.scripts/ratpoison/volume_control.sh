#! /bin/sh


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
    ratpoison -c "echo ($(~/.scripts/echo_volume.sh))"
}


function print_tmux
{
    tmux refresh-client -S
}


function save_vol
{
    current_vol=$(amixer sget Master | tail -n 1 | sed -e \
        's/.*\(\[.*%\]\).*/\1/;s/\[//;s/\]//;s/%//')
    echo "$current_vol" > /tmp/current_volume
    print_tmux
    exit 0
}


function restore_vol
{
    vol=$(cat /tmp/current_volume)
    amixer set Master "$vol"%
    print_tmux
    exit 0
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
    'save_current_vol')
        save_vol
        ;;
    'restore_previous_vol')
        restore_vol
        ;;
    'set')
        amixer set Master $2%
        print_tmux
        exit 0
        ;;
esac

print_ratposion
print_tmux
