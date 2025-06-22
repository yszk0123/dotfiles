#!/bin/bash
if ! is_exists "nvim"; then
  if confirm_with_message "Do you wish to install neovim?"; then
    brew install neovim
  fi
fi