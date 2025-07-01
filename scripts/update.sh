#!/bin/bash -ue
source "$HOME/dotfiles/scripts/common/utils.sh"

echo_color "=== Dotfiles Update Script ===" "34"

if [ -z "$ZDOTDIR" ]; then
  echo_color "Define ZDOTDIR!" "31"
  exit 1
fi

# Update package managers
if confirm_with_message "Update Homebrew packages?"; then
  echo_color "Updating Homebrew..." "32"
  brew update && brew upgrade
  brew bundle --file="$HOME/dotfiles/Brewfile"
  brew cleanup
fi

if confirm_with_message "Update mise-managed tools?"; then
  echo_color "Updating mise tools..." "32"
  mise upgrade
  mise prune
fi

if confirm_with_message "Update sheldon plugins?"; then
  echo_color "Updating sheldon plugins..." "32"
  sheldon lock
fi

# System updates
if confirm_with_message "Execute install scripts?"; then
  echo_color "Running installation scripts..." "32"
  for name in zsh tmux plain brew nvim go npm pip; do
    echo_color "Installing $name commands ..." "32"
    source "$HOME/dotfiles/scripts/install/$name.sh"
  done
fi

if confirm_with_message "Update dotfile links?"; then
  echo_color "Updating dotfile links..." "32"
  source "$HOME/dotfiles/scripts/linkDotfiles.sh"
fi

if confirm_with_message "Update macOS settings?"; then
  echo_color "Updating macOS settings..." "32"
  source "$HOME/dotfiles/scripts/updateMacSettings.sh"
fi

# Verification
if confirm_with_message "Run system verification?"; then
  echo_color "Running system verification..." "32"
  source "$HOME/dotfiles/scripts/verify.sh"
fi

echo_color "Update complete!" "32"
