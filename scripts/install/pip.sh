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

# cf. [p-e-w/maybe: :rabbit2: See what a program does before deciding whether you really want it to happen.](https://github.com/p-e-w/maybe)
for target in maybe; do
   is_installed $target  && continue

  read -r -p "Do you wish to install $target? [YyNn]" yn
  case $yn in
    [Yy]* )
      $CURRENT_PIP install "$target"
      ;;
  esac
done
