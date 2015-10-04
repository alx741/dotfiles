#!/bin/bash


function is_running
{
    PID=$(pidof -s $1)

    if [[ $PID != "" ]]
    then
        return 0
    else
        return 1
    fi
}


function launch_firefox
{
    if is_running 'firefox';
    then
        ratpoison -c "select firefox"
    else
        firefox&
    fi
}


function launch_terminal
{
    if is_running 'urxvt';
    then
        ratpoison -c "select urxvt"
    else
    urxvt -e bash -c "tmux -q has-session &>/dev/null && exec tmux attach-session -d || exec tmux new-session -n$USER -s$USER@$HOSTNAME"&
    fi
}


case "$1" in
    'firefox')
        launch_firefox
        ;;
    'terminal')
        launch_terminal
        ;;
esac
