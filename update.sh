#!/bin/bash

cd "$HOME"

read -p "Execute install? [YyNn]" yn
case $yn in
  [Yy]* ) source "dotfiles/scripts/install.sh" ;;
esac

read -p "Execute linkDotfiles? [YyNn]" yn
case $yn in
  [Yy]* ) source "dotfiles/scripts/linkDotfiles.sh" ;;
esac
