#!/bin/bash

INSTALLED_PIP_PACKAGES="$(pip list)"
CURRENT_PIP=pip3
# CURRENT_PIP=pip

function is_installed() {
  local result=$(echo "$INSTALLED_PIP_PACKAGES" | grep "^$1$")
  if [ -z "$result" ]; then
    return 1;
  else
    return 0;
  fi
}

function confirm_then_pip_install() {
  local target="$1"
  is_installed "$target" && return

  if confirm_with_message "Do you wish to install $target?"; then
    $CURRENT_PIP install "$target"
  fi
}

# cf. [p-e-w/maybe: :rabbit2: See what a program does before deciding whether you really want it to happen.](https://github.com/p-e-w/maybe)
confirm_then_pip_install maybe
