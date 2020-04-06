#!/bin/sh

VOLUME_DIR="/tmp/volume_modes"
MUSIC="$VOLUME_DIR/music"
NORMAL="$VOLUME_DIR/normal"
SELECTED="$VOLUME_DIR/selected_mode"

CARD=1
CONTROL=PCM


function build_modes
{
    if [ ! -d $VOLUME_DIR ]
    then
        mkdir "$VOLUME_DIR"
        echo 100 > "$NORMAL"
        echo 50 > "$MUSIC"
        echo "normal" > "$SELECTED"
    fi
}


function get_mode
{
    echo $(cat "$SELECTED" | tr -d '\n')
}

function current_volume
{
    echo $(amixer -c $CARD sget $CONTROL | tail -n 1 | cut -d ' ' -f 7 | tr -d '[]%')
}

function set_normal_mode
{
    if [[ $(get_mode) != "normal" ]];
    then
        echo $(current_volume) > "$MUSIC"
        amixer -c $CARD set $CONTROL $(cat $NORMAL)%
        echo "normal" > "$SELECTED"
        tmux refresh-client -S
    fi
}


function set_music_mode
{
    if [[ $(get_mode) != "music" ]];
    then
        echo $(current_volume) > "$NORMAL"
        amixer -c $CARD set $CONTROL $(cat $MUSIC)%
        echo "music" > "$SELECTED"
        tmux refresh-client -S
    fi
}


function info_formatted
{
    sound_data=$(amixer -c $CARD sget $CONTROL | tail -n 1)
    volume=$(echo $sound_data | cut -d ' ' -f 5 | tr -d '[]%')
    mute_state=$(echo $sound_data | cut -d ' ' -f 7 | tr -d '[]%')
    mode=$(get_mode)

    sound_state="$(echo $mute_state | sed 's/on//;s/off/✗/') "
    sound_state+="$(echo $volume)"
    sound_state+="$(echo $mode | sed 's/normal/ ◎/;s/music/ ♫/')"

    echo "$sound_state"
}

case "$1" in
    'info')
        info_formatted
        ;;
    'build_modes')
        build_modes
        ;;
    'set_normal_mode')
        set_normal_mode
        ;;
    'set_music_mode')
        set_music_mode
        ;;
    'toggle')
        amixer -c $CARD set $CONTROL toggle
        ;;
    'inc')
        amixer -c $CARD set $CONTROL 5%+
        ;;
    'dec')
        amixer -c $CARD set $CONTROL 5%-
        ;;
    'high')
        amixer -c $CARD set $CONTROL 100%
        ;;
    'low')
        amixer -c $CARD set $CONTROL 15%
        ;;
    'medium')
        amixer -c $CARD set $CONTROL 50%
        ;;
esac
