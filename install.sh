#!/bin/bash

# Copy .vimrc to home directory of current user
cp ./.vimrc ~/.vimrc

# Install vundle and install plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
