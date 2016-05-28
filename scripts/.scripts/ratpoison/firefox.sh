#!/bin/bash

URL=""

function set_url
{
    case "$1" in
        'facebook')
            URL="www.facebook.com"
            ;;
        'youtube')
            URL="www.youtube.com"
            ;;
        'reddit')
            URL="www.reddit.com"
            ;;
        'github')
            URL="www.github.com"
            ;;
        'evirtual')
            URL="evirtual.ucuenca.edu.ec"
            ;;
    esac
}

function select_tab
{
    cd ~/.mozrepl/
    expect select_tab.expect "$1" > /dev/null

    if [[ $? != 0 ]];
    then
        set_url "$1"
        if [[ "$URL" != "" ]];
        then
            firefox --new-tab "$URL"
        fi
    fi
}

function search
{
    search=$(xclip -selection clipboard -o)
    if [[ "$search" == "" ]];
    then
        exit 0
    fi
    search=$(echo "$search" | sed 's/ /+/g')
    google_url="https://www.google.com/search?q=$search"
    firefox --new-tab "$google_url"
}


~/.scripts/ratpoison/app_select.sh firefox
case $1 in
    'select_tab')
        select_tab $2
        ;;
    'new_tab')
        firefox --new-tab "http://"
        ;;
    'search')
        search
        ;;
esac
