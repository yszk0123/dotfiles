#!/bin/bash

# cf. [p-e-w/maybe: :rabbit2: See what a program does before deciding whether you really want it to happen.](https://github.com/p-e-w/maybe)
if ! is_exists 'maybe'; then
  read -p "Do you wish to install maybe? [YyNn]" yn
  case $yn in
    [Yy]* )
      pip install maybe || pip3 install maybe
      ;;
  esac
fi
