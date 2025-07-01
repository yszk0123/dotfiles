#!/bin/bash -ue
source "$HOME/dotfiles/scripts/common/utils.sh"

echo_color "=== Zsh Setup ===" "34"

# Note: Zsh plugins are now managed by sheldon (see ~/.config/sheldon/plugins.toml)
# This script is kept for compatibility but most functionality has been moved to sheldon

echo_color "Zsh plugins are managed by sheldon." "32"
echo_color "Configuration: ~/.config/sheldon/plugins.toml" "32"

# Check if sheldon is available
if ! command -v sheldon >/dev/null 2>&1; then
  echo_color "Warning: sheldon not found. Install it with: brew install sheldon" "33"
  exit 1
fi

# Install/update sheldon plugins
if confirm_with_message "Install/update sheldon plugins?"; then
  echo_color "Installing/updating sheldon plugins..." "32"
  sheldon lock
fi

echo_color "Zsh setup complete!" "32"
