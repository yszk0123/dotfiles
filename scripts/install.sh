#!/bin/bash

source ~/dotfiles/scripts/common/utils.sh

if [ -z "$ZDOTDIR" ]; then
  echo_color "Define ZDOTDIR!" "31"
  exit 1
fi

for name in zsh tmux plain brew go npm pip; do
  echo_color "installing $name commands ..." "32"
  source "$HOME/dotfiles/scripts/install/$name.sh"
done
