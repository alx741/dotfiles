#! /bin/sh


val=$(ratpoison -c "prompt <music> ")

case "$val" in
    'p')
        mpc toggle
        ;;
    's')
        mpc stop
        ;;
    'c')
        ~/.scripts/echo_song.sh
        ;;
    'n')
        mpc next
        ;;
    'N')
        mpc prev
        ;;
esac
