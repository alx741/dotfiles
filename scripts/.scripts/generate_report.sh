#!/bin/sh

source "$(dirname "$0")/fancy.sh"

[ -f report.md ] && displayWarning "A report already exists!" && exit 1

made markdown || exit 1

# Report template
cat <<EOF > report.md
---
title:
author: Daniel Campoverde C.
date: $(date +'%B %Y')
lang: es
bibliography: bibliography.bib
abstract: |
    Some Abstract here
numbersections: true
...

\tableofcontents

# Bibliografía
EOF


# Bibliography template
cat <<EOF > bibliography.bib
@online{some,
    title={},
    journal={},
    author={Last, Given},
    year={2015},
    month={1},
    url={},
    urldate={2020-01}
}

@article{some,
    title={},
    journal={},
    author={Last, Given},
    year={2015}
}
EOF


# gitignore template
cat <<EOF > .gitignore
report.pdf
EOF

mkdir img
