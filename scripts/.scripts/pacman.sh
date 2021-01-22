#!/bin/sh

CACHE_FILE="/tmp/pacman-aur_last_searched_package"

echo
cat ~/.ascii_art/pacman
echo

[ "$2" = "-Ss" ] && echo "$3" > "$CACHE_FILE"

case $1 in
    'pacman')
        shift 1
        sudo pacman "$@"
        ;;
    'yay')
        shift 1
        yay --noeditmenu "$@"
        ;;
    'getit')
        yay --noeditmenu -S "$(cat "$CACHE_FILE")"
        ;;
esac
