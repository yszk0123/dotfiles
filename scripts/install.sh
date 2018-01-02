#!/bin/bash

source ~/dotfiles/scripts/common/utils.sh

for name in fish tmux plain brew go npm pip; do
  echo_color "installing $name commands ..." "32"
  source "$HOME/dotfiles/scripts/install/$name.sh"
done
