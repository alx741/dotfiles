#!/bin/sh

ARCH_DEPS=(
    astyle ccze ctags ghc cabal-install git gnupg hindent mongodb mpd mplayer
    mutt mariadb ncmpcpp neovim nethack nitrogen openbox pacman ratpoison
    readline stack sxiv mpv task tmux rxvt-unicode gvim vim-runtime w3m weechat
    xmonad zathura zathura-djvu zathura-pdf-mupdf zsh acpi alsa-utils ccze
    dhclient diff-so-fancy expect figlet firefox id3v2 lolcat mpc qrencode scrot
    task unclutter xclip xdotool youtube-dl reflector stow fzf fasd wget ntp
    sshpass grep sed curl jshon expac haskell-hscolour rofi ttf-dejavu
    ttf-roboto xcape transmission-gtk gimp inkscape asciidoctor xorg-xsetroot
    xf86-input-synaptics xbindkeys xorg-xrandr zip unrar calc
    the_silver_searcher npm htop chromium cloc pandoc dnsutils bind-tools unzip
    wol tree avr-binutils avr-gcc avr-gdb avr-libc avrdude docker vagrant
    libvirt virtualbox virtualbox-host-modules-arch pacman-contrib xorg-xinput
    hasktags sassc exa bat fd smartmontools pulseaudio pulseaudio-alsa
    xorg-xinit wpa_supplicant nmap python2-lxml python2-scour
)

AUR_DEPS=(
    hub translate-shell tealdeer-git mimi-git popcorntime-bin acpilight sprunge
    python-proselint speedtest wemux cropgui svgo
)

HASK_DEPS=(
    happy alex shake yesod hakyll codex turtle
)


sudo pacman -Syy ${ARCH_DEPS[@]}

stack install ${HASK_DEPS[@]}
