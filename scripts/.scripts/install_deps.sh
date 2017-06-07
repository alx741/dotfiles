#!/bin/sh

ARCH_DEPS=(
    astyle avrdude ccze ctags ghc git gnupg hindent mongodb mpd mplayer mutt
    mariadb ncmpcpp neovim nethack newsbeuter nitrogen openbox pacman ratpoison
    readline stack sxiv task tmux rxvt-unicode gvim vim-runtime w3m weechat
    xmonad zathura zathura-djvu zathura-pdf-mupdf zsh acpi alsa-utils ccze
    dhclient diff-so-fancy expect figlet firefox id3v2 lolcat mpc qrencode scrot
    task unclutter xclip xdotool youtube-dl reflector stow fzf fasd wget ntp
    sshpass grep sed curl jshon expac haskell-hscolour rofi ttf-dejavu
    ttf-roboto xcape transmission-gtk gimp inkscape
)

AUR_DEPS=(
    hub translate-shell tealdeer-git
)

HASK_DEPS=(
    happy alex shake yesod hoogle hasktags hakyll codex
)

sudo pacman -Syy ${ARCH_DEPS[@]}

if ! type "packer" > /dev/null; then
    install_packer
fi
packer --noedit --noconfirm -S ${AUR_DEPS[@]}

stack install ${HASK_DEPS[@]}


function install_packer()
{
    cd ~
    mkdir packer
    cd packer
    wget 'https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=packer'
    mv 'PKGBUILD?h=packer' PKGBUILD
    makepkg
    sudo pacman -U packer*.tar.xz
    cd ..
    rm -rfv packer
}
