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
ln -snf $DOTFILES_DIR/.vim/ftplugin $HOME/.vim/ftplugin
ln -snf $DOTFILES_DIR/.vimrc $HOME/.vimrc

# DefaultkeyBinding.dict (macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
  if [ ! -d $HOME/Library/KeyBindings ]; then mkdir -p $HOME/Library/KeyBindings; fi
  cp -f $DOTFILES_DIR/DefaultKeyBinding.dict $HOME/Library/KeyBindings/DefaultKeyBinding.dict
fi
