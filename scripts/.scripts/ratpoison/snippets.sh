#! /bin/sh

SNIP_DIR=~/.snippets


function snippet_menu
{
    for snip in $SNIP_DIR/*
    do
        snippets+="${snip##*/}\n"
    done
    echo -e "$snippets" | sed 's/URxvt/URxvt terminal/' | rofi -dmenu -i -p "" -no-custom
}


function select_snippet
{
    snippet=`snippet_menu`

    if [[ $snippet != "" ]]
    then
        xclip -selection clipboard -i "$SNIP_DIR/$snippet"
    else
        return 0
    fi
}


select_snippet
