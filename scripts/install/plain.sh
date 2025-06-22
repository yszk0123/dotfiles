#!/bin/bash

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
