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
    [ -z "$query" ] && exit 0
    select_tab "$query"
}

function clipboard_search
{
    search=$(xclip -selection clipboard -o)
    [ -z "$search" ] && exit 0
    search=$(echo "$search" | sed 's/ /+/g')
    duckduckgo_url="https://www.duckduckgo.com/search?q=$search"
    firefox --new-tab "$duckduckgo_url"
}

function duckduckgo
{
    query=`ratpoison -c "prompt [Quack] >   "`
    [ -z "$query" ] && exit 0
    query=$(echo "$query" | sed 's/ /+/g')

    ~/.scripts/ratpoison/app_select.sh firefox
    firefox "https://duckduckgo.com/?q=$query"
}

function search_lyrics_old
{
    search=$(mpc | head -n 1)
    [ -z "$search" ] && exit 0
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

function search_lyrics
{
    search=$(mpc | head -n 1)
    [ -z "$search" ] && exit 0
    url=$(search_azlyrics "$search")
    [ -z "$url" ] && url=$(search_songtexte "$search")
    firefox --new-tab "$url"
}

function search_azlyrics
{
    search=$(echo "$1" | sed 's/-//g;s/ /+/g')

    curl -s -A 'Mozilla/5.0 (X11; Linux i586; rv:31.0) Gecko/20100101 Firefox/61.0'\
        "https://search.azlyrics.com/search.php?q=$search" > /tmp/lyrics_search_result.html

    url=$(cat /tmp/lyrics_search_result.html\
        | grep -Eo '<a href="(https://www.azlyrics.com/lyrics/[^"]*)"'\
        | grep -o 'http[^"]*'\
        | head -n 1)

    echo "$url"
}

function search_songtexte
{
    search=$(echo "$1" | sed 's/-//g;s/ /+/g')

    curl -s -A 'Mozilla/5.0 (X11; Linux i586; rv:31.0) Gecko/20100101 Firefox/61.0'\
        "https://www.songtexte.com/search?q=$search&c=all" > /tmp/lyrics_search_result.html


    url=$(cat /tmp/lyrics_search_result.html\
        | grep -Eo '<span class="song">[^<]*<a href="(songtext/[^"]*)"'\
        | grep -o 'songtext/[^"]*'\
        | head -n 1)

    echo "https://songtexte.com/$url"
}

function youtube_search
{
    query=`ratpoison -c "prompt [Youtube] >   "`
    [ -z "$query" ] && exit 0
    firefox "https://www.youtube.com/results?search_query=$query"
    ~/.scripts/ratpoison/app_select.sh firefox
}

function hoogle_search
{
    query=`ratpoison -c "prompt [Hoogle $1] >   "`
    [ -z "$query" ] && exit 0

    case "$1" in
        'hackage')
            firefox "https://www.haskell.org/hoogle/?hoogle=$query"
            ;;
        'stackage')
            firefox "http://www.stackage.org/lts-14.9/hoogle?q=$query"
            ;;
        *)
            exit 1
            ;;
    esac

    ~/.scripts/ratpoison/app_select.sh firefox
}

function rustdocs_search
{
    query=`ratpoison -c "prompt [Rust docs $1] >   "`
    [ -z "$query" ] && exit 0
    firefox "https://docs.rs/releases/search?query=$query"
    ~/.scripts/ratpoison/app_select.sh firefox
}

function rdocs_search
{
    query=`ratpoison -c "prompt [R docs $1] >   "`
    [ -z "$query" ] && exit 0
    firefox "https://www.rdocumentation.org/search?q=$query"
    ~/.scripts/ratpoison/app_select.sh firefox
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
        firefox --new-tab "http://www.duckduckgo.com"
        ;;
    'new_window')
        ratpoison -c "nextscreen"
        firefox --new-window
        ;;
    'clipboard_search')
        ~/.scripts/ratpoison/app_select.sh firefox
        clipboard_search
        ;;
    'duckduckgo')
        duckduckgo
        ;;
    'search_lyrics')
        ~/.scripts/ratpoison/app_select.sh firefox
        search_lyrics
        ;;
    'hoogle_search')
        hoogle_search $2
        ;;
    'rustdocs_search')
        rustdocs_search $2
        ;;
    'rdocs_search')
        rdocs_search $2
        ;;
    'youtube_search')
        youtube_search
        ;;
esac
