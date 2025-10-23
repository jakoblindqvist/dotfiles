#!/bin/bash

# Update global git settings
git config --global --replace-all core.editor vim
git config --global --replace-all core.excludesfile $HOME/.gitignore

# Copy dotfiles to $HOME
cp .gitignore $HOME
cp .vimrc $HOME
cp .ackrc $HOME
cp .flake8 $HOME
cp .clang-format $HOME
cp .bash_aliases $HOME

# Touch .hushlogin to disable system message on login
touch $HOME/.hushlogin

# Copy language settings
cp -r ./ftplugin $HOME/.vim

# Download vim-plug and install plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# Copy .keybindings.tmux to .byobu config directory
if [ $BYOBU_CONFIG_DIR ]; then
    cp ./.byobu/keybindings.tmux $BYOBU_CONFIG_DIR/keybindings.tmux
    touch $BYOBU_CONFIG_DIR/.always-select
fi
