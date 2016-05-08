#!/bin/sh

INSTALLED_GLOBAL_PACKAGES=$(npm ls -g)

function is_installed() {
  local result=$(echo "$INSTALLED_GLOBAL_PACKAGES" | grep "^$1$")
  if [ -z "$result" ]; then
    return 1;
  else
    return 0;
  fi
}

# cf. https://github.com/stevemao/diff-so-fancy
for target in diff-so-fancy; do
  [ is_installed $target ] && continue

  read -p "Do you wish to install $target? [YyNn]" yn
  case $yn in
    [Yy]* )
      npm install -g "$target"
      ;;
  esac
done
