#! /bin/sh

STACK_DIR="/tmp/clipboard_stack"
INDEX_FILE="$STACK_DIR/index"
SNIPPET_PREFIX="snippet_"


function build_stack
{
    if [ ! -d $STACK_DIR ]
    then
        mkdir "$STACK_DIR"
        echo "0" > "$INDEX_FILE"
    fi
}


function get_index
{
    read index < "$INDEX_FILE"
    echo "$index"
}


function set_index
{
    echo "$1" > "$INDEX_FILE"
}


function push
{
    index=$((`get_index` + 1))
    echo `xclip -selection clipboard -o` > "$STACK_DIR/$SNIPPET_PREFIX$index"
    set_index $index
}


function pop
{
    index=`get_index`
    if [[ $index -eq 0 ]]
    then
        ratpoison -c "echo Clipboard stack is empty"
        return 0
    fi

    xclip -selection clipboard -i "$STACK_DIR/$SNIPPET_PREFIX$index"
    rm "$STACK_DIR/$SNIPPET_PREFIX$index"
    set_index $(($index - 1))
}


function purge
{
    index=`get_index`
    if [[ $index -eq 0 ]]
    then
        ratpoison -c "echo Clipboard stack is empty"
        return 0
    fi

    confirmation=`ratpoison -c "prompt Purge clipboard stack? [y/n] "`

    if [ $confirmation == "y" ] || [ $confirmation == "yes" ]
    then
        rm $STACK_DIR/$SNIPPET_PREFIX*
        set_index $((0))
    fi
}


function get_snippet_preview
{
    snippet=$(cat "$1" | sed "s/\"/\\\\\"/g;s/\`/\\\\\`/g" | tr "\n" "  ")
    connector="[...]"

    if [[ `echo "$snippet" | wc -c` -le 80 ]]
    then
        echo "$snippet"

    else
        snippet_head=`echo "$snippet" | head -c 35`
        snippet_tail=`echo "$snippet" | tail -c 35`
        echo "$snippet_head $connector $snippet_tail"
    fi
}


function snippet_menu
{
    index=`get_index`
    if [[ $index -eq 0 ]]
    then
        ratpoison -c "echo Clipboard stack is empty"
        return 0
    fi

    ratmen_cmd="ratmen --title Clipboard_stack -p "
    for i in `seq $index -1 1`
    do
        snippet_file="$STACK_DIR/$SNIPPET_PREFIX$i"
        if [ ! -e $snippet_file ];then continue; fi

        preview=`get_snippet_preview "$snippet_file"`
        ratmen_cmd+="\"$preview\""
        ratmen_cmd+=" '$snippet_file' "
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


function delete_snippet
{
    snippet=`snippet_menu`

    if [[ $snippet != "" ]]
    then
        rm "$snippet"
    else
        return 0
    fi

    # If the top of the stack was removed
    # move the stack index one step back
    index=`get_index`
    top_stack_snippet="$STACK_DIR/$SNIPPET_PREFIX$index"
    if [[ $snippet ==  $top_stack_snippet ]]
    then
        set_index $(($index - 1))
    fi
}


function get_menu
{
    option=`ratmen --title Songs -pd: "Push" "Pop" "Delete" "Purge"`

    case "$option" in
        'Push')
            push
            ;;
        'Pop')
            pop
            ;;
        'Delete')
            delete_snippet
            ;;
        'Purge')
            purge
            ;;
    esac
}



build_stack

case "$1" in
    'push')
        push
        ;;
    'pop')
        pop
        ;;
    'purge')
        purge
        ;;
    'select')
        select_snippet
        ;;
    'delete')
        delete_snippet
        ;;
    'menu')
        get_menu
        ;;
esac
