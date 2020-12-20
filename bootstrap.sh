#!/bin/sh
set -e

DOTFILES_DIR=$HOME/dotfiles

# .gitconfig
ln -sf $DOTFILES_DIR/.gitconfig $HOME/.gitconfig

# .vimrc
if [ ! -d $HOME/.vim/undo ]; then mkdir -p $HOME/.vim/undo; fi
ln -sf $DOTFILES_DIR/.vimrc $HOME/.vimrc
