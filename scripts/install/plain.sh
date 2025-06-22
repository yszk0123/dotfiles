#!/bin/bash

if ! is_exists "uv"; then
  if confirm_with_message "Do you wish to install uv?"; then
    # https://github.com/astral-sh/uv
    curl -LsSf https://astral.sh/uv/install.sh | sh
  fi
fi

