#!/bin/bash

if [[ "$1" == "rat" ]]; then
current_window=$(ratpoison -c 'info' | sed 's/(.*).*(\(.*\))/\1/'\
                | tr '[:upper:]' '[:lower:]')

elif [[ "$1" == "tmux" ]];then
    window_bottom=$(tmux list-panes -F "#{window_height}" | head -n1)
    window_right=$(tmux list-panes -F "#{window_width}" | head -n1)
    window_bottom=$(($window_bottom - 1))
    window_right=$(($window_right - 1))
    pane=$(tmux list-panes -F "#{pane_left} #{pane_right} #{pane_top} #{pane_bottom} #{pane_active}" | grep '.* 1$')
    pane_left=$(echo "$pane" | cut -d' ' -f 1)
    pane_right=$(echo "$pane" | cut -d' ' -f 2)
    pane_top=$(echo "$pane" | cut -d' ' -f 3)
    pane_bottom=$(echo "$pane" | cut -d' ' -f 4)
fi


function rat_up
{
    if [[ "$current_window" == "urxvt" ]];
    then
        ratpoison -c 'meta C-k'
    else
        ratpoison -c 'focusup'
    fi
}

function rat_down
{
    if [[ "$current_window" == "urxvt" ]];
    then
        ratpoison -c 'meta C-j'
    else
        ratpoison -c 'focusdown'
    fi
}

function rat_right
{
    if [[ "$current_window" == "urxvt" ]];
    then
        ratpoison -c 'meta C-l'
    else
        ~/.scripts/ratpoison/frame-mon_navigator.sh right
    fi
}

function rat_left
{
    if [[ "$current_window" == "urxvt" ]];
    then
        ratpoison -c 'meta C-h'
    else
        ~/.scripts/ratpoison/frame-mon_navigator.sh left
    fi
}

function tmux_up
{
    if [[ $pane_top  -eq 0 ]];
    then
        ratpoison -c 'focusup'
    else
        tmux select-pane -U
    fi
}

function tmux_down
{
    if [[ $pane_bottom  -eq $window_bottom ]];
    then
        ratpoison -c 'focusdown'
    else
        tmux select-pane -D
    fi
}

function tmux_right
{
    if [[ $pane_right  -eq $window_right ]];
    then
        ~/.scripts/ratpoison/frame-mon_navigator.sh right
    else
        tmux select-pane -R
    fi
}

function tmux_left
{
    if [[ $pane_left  -eq 0 ]];
    then
        ~/.scripts/ratpoison/frame-mon_navigator.sh left
    else
        tmux select-pane -L
    fi
}


if [[ "$1" == "rat" ]];then
    case "$2" in
        'up')
            rat_up
            ;;
        'down')
            rat_down
            ;;
        'right')
            rat_right
            ;;
        'left')
            rat_left
            ;;
    esac

elif [[ "$1" == "tmux" ]];then
    case "$2" in
        'up')
            tmux_up
            ;;
        'down')
            tmux_down
            ;;
        'right')
            tmux_right
            ;;
        'left')
            tmux_left
            ;;
    esac
fi
