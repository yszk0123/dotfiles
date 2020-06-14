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

function confirm_then_yarn_add() {
  local target="$1"
  is_installed "$target" && return

  if confirm_with_message "Do you wish to install $target?"; then
    yarn global add "$target"
  fi
}

if ! is_exists "node"; then
  if confirm_with_message "Do you wish to install node (via nodebrew)?"; then
    nodebrew install-binary v8.9.4
    nodebrew use v8.9.4
  fi
fi

# cf. https://github.com/stevemao/diff-so-fancy
confirm_then_yarn_add diff-so-fancy
