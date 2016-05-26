#!/bin/bash

word=''

function get_word
{
    word=`ratpoison -c "prompt [$1]<  "`
    if [[ $word == "" ]]
    then
        exit 0
    fi
}

function to_spanish
{
    get_word EN

    translation=$(trans -b -t es $word)
    ratpoison -c "echo [ES]>  $translation"
}

function to_english
{
    get_word ES

    translation=$(trans -b -t en $word)
    ratpoison -c "echo [EN]>  $translation"
}


case "$1" in
    'to_spanish')
        to_spanish
        ;;
    'to_english')
        to_english
        ;;
esac
