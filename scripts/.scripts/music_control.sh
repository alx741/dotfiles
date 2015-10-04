#! /bin/sh


function select_playlist
{
    playlists=`mpc lsplaylists`

    ratmen_cmd="ratmen --title Playlists -pd: "
    while read -r line;
    do
        ratmen_cmd+="'$line' "
    done <<< "$playlists"

    playlist=`eval $ratmen_cmd`

    if [[ $playlist != "" ]]
    then
        mpc clear
        mpc load "$playlist"
        mpc play
    fi
}


function select_song_from_current_playlist
{
    current_song=`mpc current -f "[%artist% - %title%]|[%file%]" | tr -d '!-.' | sed -e 's/mp3//'`
    songs=`mpc playlist -f "[%artist% - %title%]|[%file%]" | tr -d '!-.' | sed -e 's/mp3//'`

    ratmen_cmd="ratmen --title Songs -p "
    counter=1
    current_song_number=1
    while read -r line;
    do
        ratmen_cmd+="'$line' "
        ratmen_cmd+="'$counter' "

        if [[ $line == $current_song ]]
        then
            current_song_number=$counter
        fi

        ((counter++))
    done <<< "$songs"

    ratmen_cmd+=" -i $current_song_number"
    song=`eval $ratmen_cmd`

    if [[ $song != "" ]]
    then
        mpc play $song
    fi
}



case "$1" in
    'toggle')
        mpc toggle
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
        ~/.scripts/echo_song.sh
        ;;
    'next')
        mpc next
        ~/.scripts/echo_song.sh
        ;;
    'previous')
        mpc prev
        ~/.scripts/echo_song.sh
        ;;
    'seek+')
        mpc seek +10
        ;;
    'seek-')
        mpc seek -10
        ;;
esac
