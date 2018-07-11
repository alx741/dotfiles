#!/bin/sh

cd ~
echo
echo Updating Mirrorlist
echo
sudo reflector --latest 100 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
echo
echo Updating System
echo
sudo pacman -Syyu --noconfirm
echo
echo Cleaning Pacman cache
echo
sudo paccache -k 3 -r
echo
echo Updating stack package index
echo
sudo stack update
echo
echo Updating Vim plugins
echo
vim -c 'PlugUpgrade | PlugUpdate | qa'
echo
echo Updating Zsh plugins
echo
zgen selfupdate && zgen update
echo
echo Updating Tmux plugins
echo
~/.tmux/plugins/tpm/scripts/update_plugin.sh all all
echo
echo Updated!
echo
