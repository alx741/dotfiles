#!/bin/bash


function is_running
{
    PID=$(pidof -s -x "$1")

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
        ratpoison -c "echo Started"
        firefox&
    fi
}


function launch_terminal
{
    if is_running 'urxvt';
    then
        ratpoison -c "select urxvt"
    else
        urxvt -e bash -c "tmux -2 -q has-session &>/dev/null && exec tmux \
            attach-session -d || exec tmux new-session -n$USER \
            -s$USER@$HOSTNAME mutt\; new-window weechat\; new-window"&
    fi
}

function launch_bare_terminal
{
    if is_running 'urxvt';
    then
        ratpoison -c "select urxvt"
    else
        urxvt -e bash -c "tmux -2 -q has-session &>/dev/null && exec tmux \
            attach-session -d || exec tmux new-session -n$USER \
            -s$USER@$HOSTNAME"&
    fi
}


function launch_zathura
{
    if is_running 'zathura';
    then
        ratpoison -c "select zathura"
    else
        zathura&
    fi
}

function launch_androidstudio
{
    if is_running 'android-studio';
    then
        ratpoison -c "select jetbrains-studio"
    else
        android-studio&
    fi
}

function launch_window_number
{
    ratpoison -c "select $1"
}

function launch_ipcam
{
    if is_running 'surf';
    then
        ratpoison -c "select surf"
    else
        surf -b -d -F -g -I -K -n -p -S "$HOME/lab/ipcamclient/index.html"&
    fi
}


function launch_ipcam
{
    if is_running 'surf';
    then
        ratpoison -c "select surf"
    else
        surf -b -d -F -g -I -K -n -p -S "$HOME/lab/ipcamclient/index.html"&
    fi
}


function launch_weechat
{
    launch_terminal
    tmux select-window -t 0
}


case "$1" in
    'firefox')
        launch_firefox
        ;;
    'terminal')
        launch_terminal
        ;;
    'bare-terminal')
        launch_bare_terminal
        ;;
    'zathura')
        launch_zathura
        ;;
    'ipcam')
        launch_ipcam
        ;;
    'weechat')
        launch_weechat
        ;;
    'androidstudio')
        launch_androidstudio
        ;;
    *)
        launch_window_number "$1"
        ;;
esac
