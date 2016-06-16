#!/bin/sh

clear
echo
cat ~/.ascii_art/octocat
echo


function clone_clipboard
{
    url=`xclip -selection clipboard -o`

    if [[ `echo "$url" | grep "github.com"` == "" ]];
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


function is_there_upstream
{
    if [[ `git remote | grep upstream` != "" ]];
    then
        return 0
    else
        return 1
    fi
}


function pull
{
    current_branch=`git branch --list --no-color | grep "*" \
        | sed -e 's/[\*[:space:]]//g'`

    if [[ "$current_branch" != "master" ]];
    then
        echo
        echo "[!] Not in master branch, better to do it manually"
        echo
        exit 0
    fi

    if is_there_upstream;
    then
        echo
        echo "Pulling from Upstream"
        echo
        git pull upstream master
    else
        echo
        echo "Pulling from Origin"
        echo
        git pull origin master
    fi
}


case $1 in
    'push')
        push
        ;;
    'pull')
        pull
        ;;
    'clone')
        clone_clipboard
        ;;
esac
