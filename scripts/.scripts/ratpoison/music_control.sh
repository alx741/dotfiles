#! /bin/sh

status=""
crafted_status=""

function select_playlist
{
    playlists=`mpc lsplaylists`
    list=$(echo -e "$playlists" | rofi -dmenu -i -p "> " -no-custom)

    if [[ "$list" != "" ]]
    then
        mpc clear
        mpc load "$list"
        $(dirname "$0")/volume_control.sh set_music_mode
        mpc play
    fi
}


function select_song_from_current_playlist
{
    songs=`mpc playlist -f "%position% %artist% - %title% ---  %file%" | sed -e 's/mp3//'`
    if [[ "$songs" == "" ]]
    then
        ratpoison -c "echo [No playlist selected]"
        return 0
    fi

    song=$(echo -e "$songs" | rofi -dmenu -i -p "> " -no-custom)
    song=$(echo "$song" | cut -d " " -f 1)

    if [[ $song != "" ]]
    then
        $(dirname "$0")/volume_control.sh set_music_mode
        mpc play $song > /dev/null
    fi
}


function search_song
{
    search_text=`ratpoison -c "prompt > "`
    if [[ $search_text == "" ]]
    then
        return 0
    fi

    search_results=$(mpc search any "$search_text")
    if [[ $search_results == "" ]]
    then
        ratpoison -c "echo [No search results]"
        return 0
    fi

    selected_song=$(echo -e "$search_results" | rofi -dmenu -i -p "> " -no-custom)

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

function search_all
{
    search_results=$(mpc listall)
    if [[ $search_results == "" ]]
    then
        ratpoison -c "echo [No search results]"
        return 0
    fi

    selected_song=$(echo -e "$search_results" | rofi -dmenu -i -p "> " -no-custom -matching glob)

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
    if [[ "$crafted_status" == "[stopped]" ]]
    then
        ratpoison -c "echo [stopped]"
    else
        rofi -e "$crafted_status" -location 7 -color-normal "#fdf6e3, #657b83"
    fi
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
    'search_all')
        search_all
        ;;
    'clear')
        mpc clear
        ;;
    'restart')
        mpc seek 0%
        ;;
    'lyrics')
        ~/.scripts/ratpoison/firefox.sh search_lyrics
        ;;
esac

assert_volume_mode > /dev/null
