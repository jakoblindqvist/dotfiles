#!/bin/bash

set -x

# Update global git settings
git config --global --replace-all core.editor vim
git config --global --replace-all core.excludesfile $HOME/.gitignore

# Copy git excludesfile
cp .gitignore $HOME

# Copy .vimrc to home directory of current user
cp .vimrc $HOME

# Copy language settings
cp -r ./ftplugin $HOME/.vim

# Download vundle and install plugins from .vimrc.
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Copy .keybindings.tmux to .byobu config directory
if [ $BYOBU_CONFIG_DIR ]; then
    cp ./.byobu/keybindings.tmux $BYOBU_CONFIG_DIR/keybindings.tmux
    touch $BYOBU_CONFIG_DIR/.always-select
fi

# Copy .flake8 config file.
cp .flake8 $HOME
