#!/bin/bash

function is_exists() {
  type "$1" >/dev/null 2>&1
  return $?
}

# Color: black (30) red (31) green (32) yellow (33) blue (34) magenta (35) cyan (36) white (37)
function echo_color() {
  local message="$1"
  local color="$2"
  echo -e "\033[0;${color}m$message\033[0;39m"
}

function confirm_with_message() {
  local message="$1"
  read -r -p "$message [YyNn]" yn
  case $yn in
    [Yy]* )
      return 0
      ;;
  esac
  return 1
}
