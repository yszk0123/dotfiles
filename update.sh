#!/bin/bash

read -p "Execute install? [YyNn]" yn
case $yn in
  [Yy]* ) source "$HOME/dotfiles/scripts/install.sh" ;;
esac

read -p "Execute linkDotfiles? [YyNn]" yn
case $yn in
  [Yy]* ) source "$HOME/dotfiles/scripts/linkDotfiles.sh" ;;
esac
