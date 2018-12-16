#!/bin/bash

if [ ! -s "$ZDOTDIR/zsh-git-prompt/zshrc.sh" ]; then
  read -r -p "Do you wish to install zsh-git-prompt? [YyNn]" yn
  case $yn in
    [Yy]* )
      pushd "$ZDOTDIR"
      git clone https://github.com/olivierverdier/zsh-git-prompt.git
      popd
      ;;
  esac
fi

if [ ! -s "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  read -r -p "Do you wish to install zsh-autosuggestions? [YyNn]" yn
  case $yn in
    [Yy]* )
      pushd "$ZDOTDIR"
      git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
      popd
      ;;
  esac
fi

if [ ! -s "$ZDOTDIR/zaw/zaw.zsh" ]; then
  read -r -p "Do you wish to install zaw? [YyNn]" yn
  case $yn in
    [Yy]* )
      pushd "$ZDOTDIR"
      git clone https://github.com/zsh-users/zaw.git
      popd
      ;;
  esac
fi

# if [ ! -s "$ZDOTDIR/zaw/zaw.zsh" ]; then
  read -r -p "Do you wish to install zsh plugins? [YyNn]" yn
  case $yn in
    [Yy]* )
      pushd "$ZDOTDIR"
      git clone --depth 1 https://github.com/zsh-users/zsh.git
      popd
      ;;
  esac
# fi

# if [ ! -s "$ZDOTDIR/completion/_docker-compose" ]; then
  read -r -p "Do you wish to install completion for docker-compose? [YyNn]" yn
  case $yn in
    [Yy]* )
      pushd "$ZDOTDIR"
      mkdir -p completion/_docker-compose
      curl -L "https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose" > ~/.zsh/completion/_docker-compose
      popd
      ;;
  esac
# fi
