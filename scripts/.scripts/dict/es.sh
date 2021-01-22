#!/bin/sh

# Spanish [ES] dictionary access
#
# Synonyms, antonyms and related words

WORD_RAW="$1"

WORD=$(echo "$WORD_RAW" | sed \
    's/a/\[\[=a=\]\]/g
    ;s/á/\[\[=a=\]\]/g
    ;s/e/\[\[=e=\]\]/g
    ;s/é/\[\[=e=\]\]/g
    ;s/i/\[\[=i=\]\]/g
    ;s/í/\[\[=i=\]\]/g
    ;s/o/\[\[=o=\]\]/g
    ;s/ó/\[\[=o=\]\]/g
    ;s/u/\[\[=u=\]\]/g
    ;s/ú/\[\[=u=\]\]/g
    ;s/ü/\[\[=u=\]\]/g
    ')

entry_raw=$(grep -i "^$WORD" "$(dirname "$0")/es_dict")
entry_word=$(echo "$entry_raw" | cut -d ',' -f1)
entry=$(echo "$entry_raw" | cut -d ',' --complement -f1)

echo "$entry_word"
echo

for i in $(seq 5)
do
    related_entry=$(echo "$entry|" | cut -s -d '|' -f "$i" | sed 's/,/, /g'\
                    | sed 's/\[ant\]/\n    Antónimos: /' \
                    | sed 's/\[par\]/\n    Parónimos: /' \
                    | sed 's/\.//g' )

    if [ "$related_entry" != "" ]; then
        echo -e "- $related_entry"
    fi
done
