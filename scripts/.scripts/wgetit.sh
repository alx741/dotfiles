#!/bin/sh


url=$(xclip -selection clipboard -o)

if [[ "$url" == "" ]];
then
    echo
    echo [!] Invalid URL in the clipboard
    echo
    exit 1
fi

wget "$url" -O $1
