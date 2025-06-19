#!/bin/bash

INSTALLED_GLOBAL_PACKAGES=$(npm ls -g)

function is_installed() {
  local result
  result=$(echo "$INSTALLED_GLOBAL_PACKAGES" | grep "^$1$")

  if [ -z "$result" ]; then
    return 1;
  else
    return 0;
  fi
}

function confirm_then_npm_install() {
  local target="$1"
  is_installed "$target" && return

  if confirm_with_message "Do you wish to install $target?"; then
    npm install -g "$target"
  fi
}

if ! is_exists "node"; then
  if confirm_with_message "Do you wish to install node (via mise)?"; then
    echo "Please install Node.js via mise: 'mise install node@22'"
    echo "Node.js version is managed in .config/mise/config.toml"
  fi
fi

# cf. https://github.com/stevemao/diff-so-fancy
# Note: diff-so-fancy is also available via Homebrew as 'brew install diff-so-fancy'
confirm_then_npm_install diff-so-fancy
