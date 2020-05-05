#!/usr/bin/env bash

DOTFILES_ROOT=`pwd`

ln -s $DOTFILES_ROOT/.gemrc $HOME/.gemrc
ln -s $DOTFILES_ROOT/.gitconfig $HOME/.gitconfig
ln -s $DOTFILES_ROOT/.gitignore_global $HOME/.gitignore_global
ln -s $DOTFILES_ROOT/.zshenv $HOME/.zshenv
ln -s $DOTFILES_ROOT/.zshrc $HOME/.zshrc
ln -s $DOTFILES_ROOT/Brewfile $HOME/Brewfile
