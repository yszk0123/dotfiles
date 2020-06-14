#!/bin/bash

if ! is_exists "nodebrew"; then
  read -r -p "Do you wish to install nodebrew? [YyNn]" yn
  case $yn in
    [Yy]* )
      curl -L git.io/nodebrew | perl - setup
      ;;
  esac
fi

if ! is_exists "fzf"; then
  read -r -p "Do you wish to install fzf? [YyNn]" yn
  case $yn in
    [Yy]* )
      git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
      ~/.fzf/install
      ;;
  esac
fi

if [ ! -s "$HOME/.vim/autoload/plug.vim" ]; then
  read -r -p "Do you wish to install plug.vim? [YyNn]" yn
  case $yn in
    [Yy]* )
      curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      ;;
  esac
fi
