#!/bin/bash
function is_exists() {
  type "$1" >/dev/null 2>&1
  return $?
}

if [ -z "$ZDOTDIR" ]; then
  echo 'Define ZDOTDIR!'
  exit 1
fi

for name in zsh tmux brew go npm pip; do
  source "$HOME/dotfiles/scripts/install/$name.sh"
done

if ! is_exists 'nodebrew'; then
  read -p "Do you wish to install nodebrew? [YyNn]" yn
  case $yn in
    [Yy]* )
      curl -L git.io/nodebrew | perl - setup
      ;;
  esac
fi

if ! is_exists 'fzf'; then
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
