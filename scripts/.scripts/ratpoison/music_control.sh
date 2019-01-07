#! /bin/sh

MUSIC_DIR="/home/alx/music"

status=""
crafted_status=""

function select_playlist
{
    playlists=`mpc lsplaylists`
    list=$(echo -e "$playlists" | rofi -dmenu -i -p "" -no-custom)

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

    song=$(echo -e "$songs" | rofi -dmenu -i -p "" -no-custom)
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

    selected_song=$(echo -e "$search_results" | rofi -dmenu -i -p "" -no-custom)

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

    selected_song=$(echo -e "$search_results" | rofi -auto-select -dmenu -i -p "" -no-custom -matching glob)

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
    if [[ "$1" == "simple" ]]; then simple=1; fi
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

        playing_time=`echo "$status" | head -n 2 | tail -n 1 | cut -d' ' -f5,6,7 | sed 's/^ //'`
        # playing_time=`echo "$playing_time" | sed -e 's/\[.*\] //'`

        playback_modes=`echo "$status" | tail -n 1 | sed -e 's/volume:[^r]*//'`
        playback_modes=`echo "$playback_modes" | sed -e 's/: on/ [*]/g'`
        playback_modes=`echo "$playback_modes" | sed -e 's/: off/ [ ]/g'`

        if [[ $simple == 1 ]];
        then
            crafted_status="$playing_status   $playing_time
      $song"
        else
        crafted_status="$playing_status   $playing_time
      $song
      $playback_modes"
        fi
    fi
}


function echo_information
{
    status=`mpc status`
    craft_status_info "$1"
    if [[ "$crafted_status" == "[stopped]" ]]
    then
        ratpoison -c "echo [stopped]"
    else
        ratpoison -c "echo $crafted_status"
    fi
}


function delete_song
{
    title=$(mpc status | head -n 1)
    file_name=$(mpc status -f "%file%" | head -n 1)
    confirm=`ratpoison -c "prompt Permanently delete \"$title?\" [y/N]  "`
    if [[ "$confirm" == "y" ]]
    then
        mpc next
        rm "$MUSIC_DIR/$file_name"
    fi
}


function show_file
{
    file_name=$(mpc status -f "%file%" | head -n 1)
    ratpoison -c "echo $MUSIC_DIR/$file_name"
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
        mpc pause
        sleep 0.3
        $(dirname "$0")/volume_control.sh set_normal_mode
    else
        $(dirname "$0")/volume_control.sh set_music_mode
        sleep 0.1
        mpc play
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
    'info')
        echo_information "simple"
        ;;
    'information')
        echo_information
        ;;
    'next')
        mpc next
        echo_information "simple"
        ;;
    'previous')
        mpc prev
        echo_information "simple"
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
    'delete')
        delete_song
        ;;
    'file')
        show_file
        ;;
    'lyrics')
        ~/.scripts/ratpoison/firefox.sh search_lyrics
        ;;
esac

assert_volume_mode > /dev/null
