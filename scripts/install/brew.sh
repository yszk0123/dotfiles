#!/bin/bash
if ! is_exists "brew"; then
  if confirm_with_message "Do you wish to install brew?"; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
fi

if ! is_exists "brew-file"; then
  brew install rcmdnk/file/brew-file
fi
