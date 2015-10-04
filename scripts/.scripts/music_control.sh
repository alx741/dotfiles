#! /bin/sh


case "$1" in
    'p')
        mpc toggle
        ;;
    's')
        mpc stop
        ;;
    'i')
        ~/.scripts/echo_song.sh
        ;;
    'n')
        mpc next
        ~/.scripts/echo_song.sh
        ;;
    'N')
        mpc prev
        ~/.scripts/echo_song.sh
        ;;
    '+')
        mpc seek +10
        ;;
    '-')
        mpc seek -10
        ;;
esac
