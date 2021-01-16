#!/bin/sh
set -e

DOTFILES_DIR=$HOME/dotfiles

# .gitconfig
ln -snf $DOTFILES_DIR/.gitconfig $HOME/.gitconfig

if [ ! -d $HOME/Codes/Education ]; then mkdir -p $HOME/Codes/Education; fi
ln -snf $DOTFILES_DIR/.gitconfig.edu $HOME/Codes/Education/.gitconfig

# .vimrc
if [ ! -d $HOME/.vim ]; then mkdir -p $HOME/.vim; fi
if [ ! -d $HOME/.vim/undo ]; then mkdir -p $HOME/.vim/undo; fi
ln -snf $DOTFILES_DIR/.vim/ftplugin $HOME/.vim/ftplugin
ln -snf $DOTFILES_DIR/.vimrc $HOME/.vimrc
