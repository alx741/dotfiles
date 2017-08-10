#!/bin/sh

perl -pe 'chomp' "$1" | xmllint --format --encode UTF-8 - | perl -pe 's#</[^a>]+>##g' > "$2"
