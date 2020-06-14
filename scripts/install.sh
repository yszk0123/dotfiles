#!/bin/bash
if [ -z "$ZDOTDIR" ]; then
  echo_color "Define ZDOTDIR!" "31"
  exit 1
fi

for name in zsh tmux plain brew go npm pip; do
  echo_color "Installing $name commands ..." "32"
  source "$HOME/dotfiles/scripts/install/$name.sh"
done
