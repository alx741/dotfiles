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
        firefox
    fi
}


function launch_qutebrowser
{
    if is_running 'qutebrowser';
    then
        ratpoison -c "select qutebrowser"
    else
        ratpoison -c "echo Started"
        qutebrowser&
    fi
}


function launch_terminal
{
    if is_running 'alacritty';
    then
        ratpoison -c "select alacritty"
    else
        alacritty -e bash -c "tmux -2 -q has-session -t main &>/dev/null && exec tmux\
            attach-session -t main -d || exec tmux new-session -s main -n$USER \
            mutt\; new-window weechat\; new-window"
    fi
}

# function launch_mon
# {
#     if is_running 'alacritty';
#     then
#         ratpoison -c "select alacritty"
#     else
#         alacritty -e bash -c "tmux -2 -q has-session -t mon &>/dev/null && exec tmux\
#             attach-session -t mon -d || exec tmux new-session -s mon -n$USER \
#             ssh -t elijah.trantor tmux a\; new-window ssh -t giskard.trantor tmux a\; \
#             new-window ssh -t miner.trantor tmux a"
#     fi
# }


function launch_bare_terminal
{
    if is_running 'alacritty';
    then
        ratpoison -c "select alacritty"
    else
        alacritty -e bash -c "tmux -2 -q has-session -t alt &>/dev/null && exec tmux\
            attach-session -t alt -d || exec tmux new-session -s alt -n$USER"&
    fi
}


function launch_zathura
{
    if is_running 'zathura';
    then
        ratpoison -c "select zathura"
    else
        ratpoison -c "echo Where be zathura?"
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

function launch_cam
{
    if is_running 'mpv';
    then
        ratpoison -c "select mpv"
    else
        "$HOME/.scripts/cams.sh" $1
    fi
}


case "$1" in
    'firefox')
        launch_firefox
        ;;
    'qutebrowser')
        launch_qutebrowser
        ;;
    'terminal')
        launch_terminal
        ;;
    # 'mon')
    #     launch_mon
    #     ;;
    'bare-terminal')
        launch_bare_terminal
        ;;
    'zathura')
        launch_zathura
        ;;
    'cam')
        launch_cam $2
        ;;
    'androidstudio')
        launch_androidstudio
        ;;
    *)
        launch_window_number "$1"
        ;;
esac
