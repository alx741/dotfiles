#!/bin/sh

clear
echo
cat ~/.ascii_art/octocat
echo

function clone_clipboard
{
    url=`xclip -selection clipboard -o`

    if [[ `echo "$url" | grep "https://github.com/"` == "" ]];
    then
        echo
        echo [!] Invalid URL in the clipboard
        echo
        exit 1
    fi

    git clone "$url"
}


case $1 in
    'push')
        git push origin master
        ;;
    'pull')
        git pull origin master
        ;;
    'clone')
        clone_clipboard
        ;;
esac
