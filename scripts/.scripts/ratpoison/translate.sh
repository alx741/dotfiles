#!/bin/bash

function select_translation
{
    langs="Inglés -> Español | en:es\nIngles -> Alemán  | en:de\n"
    langs+="Español -> Inglés | es:en\nEspañol -> Alemán | es:de\n"
    langs+="Alemán -> Español | de:es\nAlemán -> Inglés  | de:en"
    lang=$(echo -e "$langs" | rofi -dmenu -i -p "> " -no-custom -matching fuzzy)

    if [[ "$lang" != "" ]]
    then
        lang=$(echo "$lang" | cut -d "|" -f 2 | tr -d " ")
        "$0" "$lang"
    fi
}

function translate
{
    prompt=$(echo "$1" | tr '[[:lower:]]' '[[:upper:]]' \
        | sed 's/:/ -> /')
    word=`ratpoison -c "prompt $prompt   "`
    echo "$word"
    if [[ "$word" == "" ]]
    then
        exit 0
    fi

    translation=$(trans -w 80 -no-ansi "$1" "$word")
    ratpoison -c "echo $translation"
}

case "$1" in
    'select')
        select_translation
        ;;


    'en:es')
        translate "en:es"
        ;;
    'en:de')
        translate "en:de"
        ;;

    'es:en')
        translate "es:en"
        ;;
    'es:de')
        translate "es:de"
        ;;

    'de:es')
        de:es
        translate "de:es"
        ;;
    'de:en')
        translate "de:en"
        ;;
esac
