#!/bin/bash

BREW_LIST="$(brew list)"

function is_installed() {
  local result
  result=$(echo "$BREW_LIST" | grep "^$1$")

  if [ -z "$result" ]; then
    return 1;
  else
    return 0;
  fi
}

if ! is_exists "brew"; then
  read -r -p "Do you wish to install brew? [YyNn]" yn
  case $yn in
    [Yy]* )
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      ;;
  esac
fi

if ! is_exists "brew-file"; then
  brew install rcmdnk/file/brew-file
fi

for target in tree rename the_silver_searcher hub tig; do
  is_installed $target && continue

  read -r -p "Do you wish to install $target? [YyNn]" yn
  case $yn in
    [Yy]* )
      brew install "$target"
      ;;
  esac
done

if ! is_exists "yarn"; then
  read -r -p "Do you wish to install yarn? [YyNn]" yn
  case $yn in
    [Yy]* )
      brew install yarn --without-node
      ;;
  esac
fi
