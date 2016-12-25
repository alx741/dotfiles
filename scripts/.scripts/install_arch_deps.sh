#!/bin/sh

DEPS=(
    astyle avrdude ccze ctags ghc git gnupg hindent mongodb mpd mplayer mutt
    mariadb ncmpcpp neovim nethack newsbeuter nitrogen openbox pacman ratpoison
    readline stack sxiv task tmux rxvt-unicode gvim vim-runtime w3m weechat
    xmonad zathura zathura-djvu zathura-pdf-mupdf zsh acpi alsa-utils ccze
    dhclient diff-so-fancy expect figlet firefox id3v2 lolcat mpc qrencode scrot
    task unclutter xclip xdotool youtube-dl reflector stow fzf fasd wget ntp
    sshpass
)

sudo pacman -Syy ${DEPS[@]}
