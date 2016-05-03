#!/bin/bash

# cf. https://github.com/stevemao/diff-so-fancy
if ! is_exists 'diff-so-fancy'; then
  read -p "Do you wish to install diff-so-fancy? [YyNn]" yn
  case $yn in
    [Yy]* )
      npm install -g diff-so-fancy
      ;;
  esac
fi
