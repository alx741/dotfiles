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
        'hades')
            URL="hades.alx.mooo.com:8080"
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

function search_tab
{
    query=`ratpoison -c "prompt [Tab] >  "`
    if [[ "$query" == "" ]]; then exit 0; fi

    select_tab "$query"
}

function clipboard_search
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

function search_lyrics
{
    search=$(mpc | head -n 1)
    if [[ "$search" == "" ]];
    then
        exit 0
    fi
    search+=" lyrics"
    search=$(echo "$search" | sed 's/ /+/g')

    curl -A 'Mozilla/5.0 (X11; Linux i586; rv:31.0) Gecko/20100101 Firefox/31.0'\
        "https://www.google.com/search?q=$search"\
            > /tmp/google_search_result.html

    url=$(sed 's/>/>\r\n/g' /tmp/google_search_result.html\
        | grep -m 1 '<a href="http:.*".*>'\
        | sed -e 's/.*href="\([^"]*\)".*/\1/')

    firefox --new-tab "$url"
}


case $1 in
    'select_tab')
        ~/.scripts/ratpoison/app_select.sh firefox
        select_tab $2
        ;;
    'focus_tab')
        select_tab $2
        ;;
    'search_tab')
        search_tab
        ;;
    'new_tab')
        ~/.scripts/ratpoison/app_select.sh firefox
        firefox --new-tab "http://www.google.com"
        ;;
    'new_window')
        ratpoison -c "nextscreen"
        firefox --new-window "http://www.google.com"
        ;;
    'clipboard_search')
        ~/.scripts/ratpoison/app_select.sh firefox
        clipboard_search
        ;;
    'search_lyrics')
        ~/.scripts/ratpoison/app_select.sh firefox
        search_lyrics
        ;;
    'cam')
        ~/.scripts/ratpoison/app_select.sh firefox
        firefox "http://192.168.1.100:81/index.htm"
        ;;
esac
