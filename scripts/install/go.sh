#!/bin/bash

for target in "https://github.com/motemen/ghq" "https://github.com/typester/gh-open" "https://github.com/peco/peco"; do
  TARGET_POSTFIX="${target##*/}"
  [ is_exists $TARGET_POSTFIX ] && continue

  read -p "Do you wish to install $TARGET_POSTFIX? [YyNn]" yn
  case $yn in
    [Yy]* ) go get $target ;;
  esac
done
