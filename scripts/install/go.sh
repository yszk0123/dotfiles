#!/bin/bash

if ! is_exists 'ghq'; then
  read -p "Do you wish to install ghq? [YyNn]" yn
  case $yn in
    [Yy]* ) go get https://github.com/motemen/ghq ;;
  esac
fi

if ! is_exists 'gh-open'; then
  read -p "Do you wish to install gh-open? [YyNn]" yn
  case $yn in
    [Yy]* ) go get https://github.com/typester/gh-open ;;
  esac
fi

if ! is_exists 'peco'; then
  read -p "Do you wish to install ghq? [YyNn]" yn
  case $yn in
    [Yy]* ) go get https://github.com/peco/peco ;;
  esac
fi
