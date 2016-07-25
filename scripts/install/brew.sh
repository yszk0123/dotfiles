#!/bin/bash

BREW_LIST="$(brew list)"

function is_installed() {
  local result=$(echo "$BREW_LIST" | grep "^$1$")
  if [ -z "$result" ]; then
    return 1;
  else
    return 0;
  fi
}

if ! is_exists "brew"; then
  read -p "Do you wish to install brew? [YyNn]" yn
  case $yn in
    [Yy]* )
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      ;;
  esac
fi

for target in git-secrets the_silver_searcher hub; do
  [ is_installed $target ] && continue

  read -p "Do you wish to install $target? [YyNn]" yn
  case $yn in
    [Yy]* )
      brew install "$target"
      ;;
  esac
done

# cf. https://github.com/neovim/homebrew-neovim/blob/master/README.md
if ! is_exists "nvim"; then
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
