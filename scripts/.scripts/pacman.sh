#!/bin/sh

CACHE_FILE="/tmp/pacman-packer_last_searched_package"

echo
cat ~/.ascii_art/pacman
echo

if [[ "$2" == "-Ss" ]]; then
    echo "$3" > "$CACHE_FILE"
fi


case $1 in
    'pacman')
        shift 1
        sudo pacman "$@"
        ;;
    'packer')
        shift 1
        packer --noedit --noconfirm "$@"
        ;;
    'getit')
        packer --noedit --noconfirm -S $(cat "$CACHE_FILE")
        ;;
    'update')
        echo Updating mirrorlist...
        echo
        sudo reflector --latest 100 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
        sudo pacman -Syyu --noconfirm
        ;;
esac
