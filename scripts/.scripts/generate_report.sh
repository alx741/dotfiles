#!/bin/sh

source "$(dirname "$0")/fancy.sh"

if [[ -f report.md ]]; then
    displayWarning "A report already exists!"
    exit 1
fi

made markdown

if [[ $? != 0 ]]; then
    displayError "Can't create Makefile! Maybe one already exists?"
    exit 1
fi

cat <<EOF > report.md
---
title:
author: Daniel Campoverde C.
abstract: |
    Some Abstract here
...

EOF

mkdir img
