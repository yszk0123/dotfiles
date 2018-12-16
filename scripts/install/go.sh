#!/bin/bash

for target in "github.com/motemen/ghq" "github.com/typester/gh-open"; do
  TARGET_POSTFIX="${target##*/}"
  is_exists $TARGET_POSTFIX && continue

  read -r -p "Do you wish to install $TARGET_POSTFIX? [YyNn]" yn
  case $yn in
    [Yy]* ) go get $target ;;
  esac
done
