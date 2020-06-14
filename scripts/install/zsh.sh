#!/bin/bash

if [ ! -s "$ZDOTDIR/zsh-git-prompt/zshrc.sh" ]; then
  if "Do you wish to install zsh-git-prompt?"; then
    pushd "$ZDOTDIR" || exit
    git clone https://github.com/olivierverdier/zsh-git-prompt.git
    popd || exit
  fi
fi

if [ ! -s "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  if "Do you wish to install zsh-autosuggestions?"; then
    pushd "$ZDOTDIR" || exit
    git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    popd || exit
  fi
fi

if [ ! -s "$ZDOTDIR/zaw/zaw.zsh" ]; then
  if "Do you wish to install zaw?"; then
    pushd "$ZDOTDIR" || exit
    git clone https://github.com/zsh-users/zaw.git
    popd || exit
  fi
fi

# if [ ! -s "$ZDOTDIR/zaw/zaw.zsh" ]; then
  if "Do you wish to install zsh plugins?"; then
    pushd "$ZDOTDIR" || exit
    git clone --depth 1 https://github.com/zsh-users/zsh.git
    popd || exit
  fi
# fi

# if [ ! -s "$ZDOTDIR/completion/_docker-compose" ]; then
  if "Do you wish to install completion for docker-compose?"; then
    pushd "$ZDOTDIR" || exit
    mkdir -p completion/_docker-compose
    curl -L "https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose" > ~/.zsh/completion/_docker-compose
    popd || exit
  fi
# fi
