#! /bin/sh

SNIP_DIR=~/.snippets


function snippet_menu
{
    ratmen_cmd="ratmen --title Snippets -p "
    for snip in $SNIP_DIR/*
    do
        ratmen_cmd+="${snip##*/}"
        ratmen_cmd+=" '$snip' "
    done
    selected_snippet=`eval $ratmen_cmd`

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
