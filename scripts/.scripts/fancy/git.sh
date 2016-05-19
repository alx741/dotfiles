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


function push
{
    current_branch=`git branch --list --no-color | grep "*" \
        | sed -e 's/[\*[:space:]]//g'`

    if [[ "$current_branch" == "master" ]];
    then
        echo
        echo "Pushing to master"
        echo
        git push origin master
    else
        echo
        read -p "Push to $current_branch? [y/N] " push
        echo

        if [[ "$push" == "y" ]];
        then
            echo
            echo "Pushing to $current_branch"
            echo
            git push origin "$current_branch"
        fi
    fi
}


case $1 in
    'push')
        push
        ;;
    'pull')
        git pull origin master
        ;;
    'clone')
        clone_clipboard
        ;;
esac
