#!/bin/bash
if ! is_exists "brew"; then
  if confirm_with_message "Do you wish to install brew?"; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
fi

if ! is_exists "brew-file"; then
  brew install rcmdnk/file/brew-file
fi
