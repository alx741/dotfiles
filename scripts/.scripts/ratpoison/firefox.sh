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
        'evirtual')
            URL="evirtual.ucuenca.edu.ec"
            ;;
    esac
}

function select_tab
{
    ~/.scripts/ratpoison/app_select.sh firefox
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


case $1 in
    'select_tab')
        select_tab $2
        ;;
esac
