#!/bin/bash

if ! is_exists "fzf"; then
  if "Do you wish to install fzf?"; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
  fi
fi

if ! is_exists "uv"; then
  if "Do you wish to install uv?"; then
    # https://github.com/astral-sh/uv
    curl -LsSf https://astral.sh/uv/install.sh | sh
  fi
fi

if [ ! -s "$HOME/.vim/autoload/plug.vim" ]; then
  if "Do you wish to install plug.vim?"; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
fi
