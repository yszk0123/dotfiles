#!/bin/bash

if ! is_exists 'brew'; then
  read -p "Do you wish to install brew? [YyNn]" yn
  case $yn in
    [Yy]* )
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      ;;
  esac
fi

# cf. https://github.com/neovim/homebrew-neovim/blob/master/README.md
if ! is_exists 'nvim'; then
  read -p "Do you wish to install nvim? [YyNn]" yn
  case $yn in
    [Yy]* )
      brew tap neovim/neovim
      brew install --HEAD neovim
      ;;
  esac
else
  read -p "Do you wish to update nvim? [YyNn]" yn
  case $yn in
    [Yy]* )
      brew update
      brew upgrade neovim
      ;;
  esac
fi

if ! is_exists 'the_silver_searcher'; then
  read -p "Do you wish to install the_silver_searcher? [YyNn]" yn
  case $yn in
    [Yy]* )
      brew install the_silver_searcher
      ;;
  esac
fi
