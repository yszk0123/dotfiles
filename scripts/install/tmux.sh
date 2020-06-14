#!/bin/bash

if [ ! -s "$HOME/.tmux/plugins/tpm/tpm" ]; then
  if "Do you wish to install tpm?"; then
    mkdir -p ~/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
fi
