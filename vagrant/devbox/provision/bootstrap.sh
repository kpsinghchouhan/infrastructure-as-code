#!/usr/bin/env bash

# Upgrade packages
apt update -y
apt upgrade -y

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

# Install GitHub CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
apt update -y
apt install gh -y