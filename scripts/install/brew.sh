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

function confirm_then_brew_install() {
  local target="$1"
  is_installed "$target" && return

  if confirm_with_message "Do you wish to install $target?"; then
    brew install "$target"
  fi
}

if ! is_exists "brew"; then
  if confirm_with_message "Do you wish to install brew?"; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
fi

if ! is_exists "brew-file"; then
  brew install rcmdnk/file/brew-file
fi

confirm_then_brew_install tree
confirm_then_brew_install rename
confirm_then_brew_install ripgrep
confirm_then_brew_install hub
confirm_then_brew_install tig
