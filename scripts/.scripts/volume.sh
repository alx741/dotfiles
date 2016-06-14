#!/bin/sh

VOLUME_DIR="/tmp/volume_modes"
MUSIC="$VOLUME_DIR/music"
NORMAL="$VOLUME_DIR/normal"
SELECTED="$VOLUME_DIR/selected_mode"


function vol_build_modes
{
    if [ ! -d $VOLUME_DIR ]
    then
        mkdir "$VOLUME_DIR"
        echo 100 > "$NORMAL"
        echo 50 > "$MUSIC"
        echo "normal" > "$SELECTED"
    fi
}


function vol_get_current
{
    echo $(amixer sget Master | tail -n 1 | sed -e \
        's/.*\(\[.*%\]\).*/\1/;s/\[//;s/\]//;s/%//')
}


function vol_get_mode
{
    echo $(cat "$SELECTED" | tr -d '\n')
}


function vol_set_normal_mode
{
    if [[ $(vol_get_mode) != "normal" ]];
    then
        echo $(vol_get_current) > "$MUSIC"
        amixer set Master $(cat $NORMAL)%
        echo "normal" > "$SELECTED"
    fi
}


function vol_set_music_mode
{
    if [[ $(vol_get_mode) != "music" ]];
    then
        echo $(vol_get_current) > "$NORMAL"
        amixer set Master $(cat $MUSIC)%
        echo "music" > "$SELECTED"
    fi
}


function vol_echo_formatted
{
    sound_data=$(amixer sget Master | tail -n 1)
    volume=$(echo $sound_data | awk '{print $4}' | tr -d '[]%')
    mute_state=$(echo $sound_data | awk '{print $6}' | tr -d '[]')
    mode=$(vol_get_mode)

    sound_state="$(echo $mute_state | sed 's/on/-/;s/off/M/') "
    sound_state+="$(echo $volume) "
    sound_state+="$(echo $mode | sed 's/normal/ N/;s/music/ >/')"

    echo "$sound_state"
}

vol_build_modes
