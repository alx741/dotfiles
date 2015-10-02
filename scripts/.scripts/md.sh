#!/bin/bash

# Read Markdown files like man pages

pandoc -s -f markdown -t man $1 | man -l -
