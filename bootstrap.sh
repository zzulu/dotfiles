#!/bin/sh
set -e

DOTFILES_DIR=$HOME/.dotfiles

# .gitconfig
ln -snf $DOTFILES_DIR/.gitconfig $HOME/.gitconfig

if [ ! -d $HOME/Codes/Educations ]; then mkdir -p $HOME/Codes/Educations; fi
ln -snf $DOTFILES_DIR/.gitconfig.edu $HOME/Codes/Educations/.gitconfig

# .vimrc
if [ ! -d $HOME/.vim ]; then mkdir -p $HOME/.vim; fi
if [ ! -d $HOME/.vim/undo ]; then mkdir -p $HOME/.vim/undo; fi
if [ ! -d $HOME/.vim/swap ]; then mkdir -p $HOME/.vim/swap; fi
if [ ! -d $HOME/.vim/backup ]; then mkdir -p $HOME/.vim/backup; fi
ln -snf $DOTFILES_DIR/.vim/ftplugin $HOME/.vim/ftplugin
ln -snf $DOTFILES_DIR/.vimrc $HOME/.vimrc

# Neovim
if [ ! -d $HOME/.config ]; then mkdir -p $HOME/.config; fi
if [ ! -d $HOME/.config/nvim ]; then mkdir -p $HOME/.config/nvim; fi
ln -snf $DOTFILES_DIR/.config/nvim/init.vim $HOME/.config/nvim/init.vim

# DefaultkeyBinding.dict (macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
  if [ ! -d $HOME/Library/KeyBindings ]; then mkdir -p $HOME/Library/KeyBindings; fi
  cp -f $DOTFILES_DIR/DefaultKeyBinding.dict $HOME/Library/KeyBindings/DefaultKeyBinding.dict
fi
