#!/bin/bash

if [ ! -s "$HOME/.tmux/plugins/tpm/tpm" ]; then
  read -r -p "Do you wish to install tpm? [YyNn]" yn
  case $yn in
    [Yy]* )
      mkdir -p ~/.tmux/plugins
      git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
      ;;
  esac
fi
