#!/bin/bash


function ratmen_select
{
    window_list=$(ratpoison -c "windows")

    vmenu_cmd="vmenu --title Windows "
    for line in $window_list
    do
        number=$(echo $line | head -c 1)
        vmenu_cmd+="'$line' "
        vmenu_cmd+="'ratpoison -c \"select $number\"' "
    done

    eval $vmenu_cmd
}


function fzf_select
{
    pattern=$(ratpoison -c "prompt > ")
    if [[ "$pattern" == "" ]];
    then
        exit 0
    fi

    window_list=$(ratpoison -c "windows %c")
    selected=$(echo "$window_list" | fzf -q "$pattern" -1 -0)

    if [[ "$selected" != "" ]];
    then
        ratpoison -c "select $selected"
    else
        ratpoison -c "echo [!] There is no a matching window for \"$pattern\""
    fi
}


case $1 in
    'ratmen')
        ratmen_select
        ;;
    'fzf')
        fzf_select
        ;;
esac
