#!/bin/bash
source "$HOME/dotfiles/scripts/common/utils.sh"

if confirm_with_message "Execute install?"; then
  source "$HOME/dotfiles/scripts/install.sh"
fi

if confirm_with_message "Execute linkDotfiles?"; then
  source "$HOME/dotfiles/scripts/linkDotfiles.sh"
fi

if confirm_with_message "Execute updateMacSettings?"; then
  source "$HOME/dotfiles/scripts/updateMacSettings.sh"
fi
