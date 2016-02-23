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


function get_current_vol
{
    echo $(amixer sget Master | tail -n 1 | sed -e \
        's/.*\(\[.*%\]\).*/\1/;s/\[//;s/\]//;s/%//')
}


# Returns safe value if none saved volume exists
function get_previous_vol
{
    if [[ ! -f /tmp/saved_volume ]];
    then
        echo 50
    else
        echo $(cat /tmp/saved_volume)
    fi
}


function toggle_previous_volume
{
    previous_vol=$(get_previous_vol)
    current_vol=$(get_current_vol)
    echo "$current_vol" > /tmp/saved_volume
    amixer set Master "$previous_vol"%
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
    'toggle_previous_volume')
        toggle_previous_volume
        ;;
    'set')
        amixer set Master $2%
        print_tmux
        exit 0
        ;;
esac

print_ratposion
print_tmux
