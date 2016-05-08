#!/bin/bash

source ~/dotfiles/scripts/common/utils.sh

if [ -z "$ZDOTDIR" ]; then
  echo_color "Define ZDOTDIR!" "31"
  exit 1
fi

for name in zsh tmux brew go npm pip; do
  echo_color "installing $name commands ..." "32"
  source "$HOME/dotfiles/scripts/install/$name.sh"
done

if ! is_exists "nodebrew"; then
  read -p "Do you wish to install nodebrew? [YyNn]" yn
  case $yn in
    [Yy]* )
      curl -L git.io/nodebrew | perl - setup
      ;;
  esac
fi

if ! is_exists "fzf"; then
  read -p "Do you wish to install fzf? [YyNn]" yn
  case $yn in
    [Yy]* )
      git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
      ~/.fzf/install
      ;;
  esac
fi

if [ ! -s "$HOME/.vim/autoload/plug.vim" ]; then
  read -p "Do you wish to install plug.vim? [YyNn]" yn
  case $yn in
    [Yy]* )
      curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      ;;
  esac
fi
