#! /bin/sh


status=""
crafted_status=""


function select_playlist
{
    playlists=`mpc lsplaylists`

    vmenu_cmd="vmenu --unfocus-exit --title Playlists -pd: "
    while read -r line;
    do
        vmenu_cmd+="'$line' "
    done <<< "$playlists"

    playlist=`eval $vmenu_cmd`

    if [[ $playlist != "" ]]
    then
        mpc clear
        mpc load "$playlist"
        $(dirname "$0")/volume_control.sh set_music_mode
        mpc play
    fi
}


function select_song_from_current_playlist
{
    current_song=`mpc current -f "[%artist% - %title%]|[%file%]" | tr -d '!-.' | sed -e 's/mp3//'`
    songs=`mpc playlist -f "[%artist% - %title%]|[%file%]" | tr -d '!-.' | sed -e 's/mp3//'`
    if [[ $songs == "" ]]
    then
        ratpoison -c "echo [No playlist selected]"
        return 0
    fi

    vmenu_cmd="vmenu --unfocus-exit --title Songs -p "
    counter=1
    current_song_number=1
    while read -r line;
    do
        vmenu_cmd+="'$line' "
        vmenu_cmd+="'$counter' "

        if [[ $line == $current_song ]]
        then
            current_song_number=$counter
        fi

        ((counter++))
    done <<< "$songs"

    vmenu_cmd+=" -i $current_song_number"
    song=`eval $vmenu_cmd`

    if [[ $song != "" ]]
    then
        $(dirname "$0")/volume_control.sh set_music_mode
        mpc play $song
    fi
}


function search_song
{
    search_text=`ratpoison -c "prompt song? "`
    if [[ $search_text == "" ]]
    then
        return 0
    fi

    search_results=$(mpc search any "$search_text" | sed "s/'/\\\'/g;s/\`/\\\\\`/g")
    if [[ $search_results == "" ]]
    then
        ratpoison -c "echo [No search results]"
        return 0
    fi

    vmenu_cmd="vmenu --unfocus-exit --title Search -pd: "
    while read -r line;
    do
        vmenu_cmd+="\"$line\" "
    done <<< "$search_results"

    selected_song=`eval $vmenu_cmd`

    if [[ $selected_song != "" ]]
    then
        song=$(echo "$selected_song" | sed 's/\\//')
        echo "$song"
        mpc insert "$song"
        mpc next
        $(dirname "$0")/volume_control.sh set_music_mode
        mpc play
    fi
}


function is_stopped
{
    lines=`echo "$status" | wc -l`

    if [[ $lines -lt 2 ]]
    then
        return 0
    else
        return 1
    fi
}


function is_paused
{
    if [[ `echo "$status" | grep "\[paused\]"` != "" ]]
    then
        return 0
    else
        return 1
    fi
}


function is_playing
{
    if [[ `mpc status | grep "\[playing\]"` != "" ]]
    then
        return 0
    else
        return 1
    fi
}


function craft_status_info
{
    playing_symbol=">"
    paused_symbol="|"
    stopped_symbol="stopped"

    playing_status=""
    song=""
    playing_time=""
    playback_modes=""

    if is_stopped
    then
        # Stopped
        playing_status="[$stopped_symbol]"

        crafted_status="$playing_status"
    else
        if is_paused
        then
            # Paused
            playing_status="[$paused_symbol]"
        else
            # Playing
            playing_status="[$playing_symbol]"
        fi

        song=`echo "$status" | head -n 1`

        playing_time=`echo "$status" | head -n 2 | tail -n 1`
        playing_time=`echo "$playing_time" | sed -e 's/\[.*\] //'`

        playback_modes=`echo "$status" | tail -n 1 | sed -e 's/volume:[^r]*//'`
        playback_modes=`echo "$playback_modes" | sed -e 's/: on/ [*]/g'`
        playback_modes=`echo "$playback_modes" | sed -e 's/: off/ [ ]/g'`

        crafted_status="$playing_status
        $song
        $playing_time
        $playback_modes"
    fi
}


function echo_information
{

    status=`mpc status`
    craft_status_info
    ratpoison -c "echo $crafted_status"
}


function seek
{
    position=$(mpc status | grep -e '(*%)' | sed -e 's/.*\((.*)\).*/\1/' | \
        sed -e 's/(//;s/%//;s/)//')
    left=$((100-position))

    case "$1" in
        '-')
            if [[ $position -lt 5 ]];
            then
                mpc seek -"$position"%
            else
                mpc seek -5%
            fi
            ;;
        '--')
            if [[ $position -lt 20 ]];
            then
                mpc seek -"$position"%
            else
                mpc seek -20%
            fi
            ;;
        '+')
            if [[ $left -lt 5 ]];
            then
                mpc seek 97%
            else
                mpc seek +5%
            fi
            ;;
        '++')
            if [[ $left -lt 20 ]];
            then
                mpc seek 97%
            else
                mpc seek +20%
            fi
            ;;
    esac
}


function toggle_playback
{
    case "$1" in
        'repeat')
            mpc repeat
            ;;
        'random')
            mpc random
            ;;
        'single')
            mpc single
            ;;
        'consume')
            mpc consume
            ;;
    esac
}


function toggle
{
    if is_playing;
    then
        mpc toggle
        sleep 0.3
        $(dirname "$0")/volume_control.sh set_normal_mode
    else
        $(dirname "$0")/volume_control.sh set_music_mode
        mpc toggle
    fi
}


function assert_volume_mode
{
    if is_playing;
    then
        $(dirname "$0")/volume_control.sh set_music_mode
    else
        $(dirname "$0")/volume_control.sh set_normal_mode
    fi
}



case "$1" in
    'toggle')
        toggle
        ;;
    'select_song')
        select_song_from_current_playlist
        ;;
    'select_playlist')
        select_playlist
        ;;
    'stop')
        mpc stop
        ;;
    'information')
        echo_information
        ;;
    'next')
        mpc next
        echo_information
        ;;
    'previous')
        mpc prev
        echo_information
        ;;
    'seek+')
        seek "+"
        ;;
    'seek++')
        seek "++"
        ;;
    'seek-')
        seek "-"
        ;;
    'seek--')
        seek "--"
        ;;
    'playback')
        toggle_playback $2
        echo_information
        ;;
    'search')
        search_song
        ;;
    'restart')
        mpc seek 0%
        ;;
esac

assert_volume_mode
