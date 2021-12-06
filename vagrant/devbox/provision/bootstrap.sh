#!/usr/bin/env bash

# Upgrade packages
apt-get update -y
apt-get upgrade -y

# Git and Vim Configuration
cd /home/vagrant
mkdir -p "$HOME/bin/dotfiles"
cp -R /vagrant/configs/vim/ "$HOME/bin/dotfiles/"
cp -R /vagrant/configs/git/ "$HOME/bin/dotfiles/"

# Create symlinks for Vim and Git configuration
ln -nfs "$HOME/bin/dotfiles/vim/vimrc" "$HOME/.vimrc"
ln -nfs "$HOME/bin/dotfiles/vim/gvimrc" "$HOME/.gvimrc"
ln -nfs "$HOME/bin/dotfiles/vim" "$HOME/.vim"
ln -nfs "$HOME/bin/dotfiles/git/gitconfig_linux" "$HOME/.gitconfig"
