#!/bin/bash

set -x

# Update global git settings
git config --global --replace-all core.editor vim
git config --global --replace-all core.excludesfile ~/.gitignore

# Copy git excludesfile
cp ./.gitignore ~/.gitignore

# Copy .vimrc to home directory of current user
cp ./.vimrc ~/.vimrc

# Copy language settings
cp -r ./ftplugin ~/.vim

# Install vundle and install plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Copy .keybindings.tmux to .byobu config directory
if [ $BYOBU_CONFIG_DIR ]; then
    cp ./.byobu/keybindings.tmux $BYOBU_CONFIG_DIR/keybindings.tmux
    touch $BYOBU_CONFIG_DIR/.always-select
fi
