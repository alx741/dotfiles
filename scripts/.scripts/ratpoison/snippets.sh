#! /bin/sh

SNIP_DIR=~/.snippets


function snippet_menu
{
    vmenu_cmd="vmenu --unfocus-exit --title Snippets -p "
    for snip in $SNIP_DIR/*
    do
        vmenu_cmd+="${snip##*/}"
        vmenu_cmd+=" '$snip' "
    done
    selected_snippet=`eval $vmenu_cmd`

    if [[ $selected_snippet != "" ]]
    then
        echo "$selected_snippet"
    fi
}


function select_snippet
{
    snippet=`snippet_menu`

    if [[ $snippet != "" ]]
    then
        xclip -selection clipboard -i "$snippet"
    else
        return 0
    fi
}


select_snippet
