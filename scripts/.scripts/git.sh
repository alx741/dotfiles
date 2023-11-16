#!/bin/sh

clone_clipboard()
{
    url=$(xclip -selection clipboard -o)

    if [ "$(echo "$url" | grep "github\|gitlab")" = "" ];
    then
        echo
        echo [!] Invalid URL in the clipboard
        echo
        exit 1
    fi

    git clone "$url"
}

get_current_branch()
{
    git branch --list --no-color | grep "\*" | sed -e 's/[\*[:space:]]//g'
}

pushforce()
{
    current_branch=$(get_current_branch)
    echo
    echo -n "[!] FORCE PUSH to $current_branch? [yes/NO] "
    read -r push
    echo

    if [ "$push" = "yes" ];
    then
        echo
        echo "FORCE Pushing to $current_branch"
        echo
        git push origin --force "$current_branch"
    fi
}

push()
{
    current_branch=$(get_current_branch)
    echo
    echo "Pushing to $current_branch"
    echo
    git push origin "$current_branch"
}


is_there_upstream()
{
    if [ "$(git remote | grep upstream)" != "" ];
    then
        return 0
    else
        return 1
    fi
}


pull()
{
    current_branch=$(get_current_branch)

    if [ "$current_branch" != "master" ];
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

add_upstream()
{
    url=$(xclip -selection clipboard -o)

    if [ "$(echo "$url" | grep "github.com")" = "" ];
    then
        echo
        echo [!] Invalid URL in the clipboard
        echo
        exit 1
    fi

    git remote add upstream "$url"
    git remote -v
}

case $1 in
    'push')
        push
        ;;
    'pushforce')
        pushforce
        ;;
    'pull')
        pull
        ;;
    'clone')
        clone_clipboard
        ;;
    'add_upstream')
        add_upstream
        ;;
esac
