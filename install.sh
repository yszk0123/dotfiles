#!/bin/bash
function is_exists() {
  type "$1" >/dev/null 2>&1
  return $?
}

if [ -z "$ZDOTDIR" ]; then
  echo 'Define ZDOTDIR!'
  exit 1
fi

if [ ! -s "$ZDOTDIR/zsh-git-prompt/zshrc.sh" ]; then
  read -p "Do you wish to install zsh-git-prompt? [YyNn]" yn
  case $yn in
    [Yy]* )
      pushd $ZDOTDIR
      git clone https://github.com/olivierverdier/zsh-git-prompt.git
      popd
      ;;
  esac
fi

if [ ! -s "$ZDOTDIR/zaw/zaw.zsh" ]; then
  read -p "Do you wish to install zaw? [YyNn]" yn
  case $yn in
    [Yy]* )
      pushd $ZDOTDIR
      git clone https://github.com/zsh-users/zaw.git
      popd
      ;;
  esac
fi

# if [ ! -s "$ZDOTDIR/zaw/zaw.zsh" ]; then
  read -p "Do you wish to install zsh plugins? [YyNn]" yn
  case $yn in
    [Yy]* )
      pushd $ZDOTDIR
      git clone --depth 1 https://github.com/zsh-users/zsh.git
      popd
      ;;
  esac
# fi

if [ ! -s "$HOME/.tmux/plugins/tpm/tpm" ]; then
  read -p "Do you wish to install tpm? [YyNn]" yn
  case $yn in
    [Yy]* )
      pushd $ZDOTDIR
      git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
      pop
      ;;
  esac
fi

if ! is_exists 'brew'; then
  read -p "Do you wish to install brew? [YyNn]" yn
  case $yn in
    [Yy]* )
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      ;;
  esac
fi

if ! is_exists 'ghq'; then
  read -p "Do you wish to install ghq? [YyNn]" yn
  case $yn in
    [Yy]* ) go get https://github.com/motemen/ghq ;;
  esac
fi

if ! is_exists 'gh-open'; then
  read -p "Do you wish to install gh-open? [YyNn]" yn
  case $yn in
    [Yy]* ) go get https://github.com/typester/gh-open ;;
  esac
fi

if ! is_exists 'peco'; then
  read -p "Do you wish to install ghq? [YyNn]" yn
  case $yn in
    [Yy]* ) go get https://github.com/peco/peco ;;
  esac
fi

if ! is_exists 'nvim'; then
  read -p "Do you wish to install nvim? [YyNn]" yn
  case $yn in
    [Yy]* )
      brew tap neovim/neovim
      brew install --HEAD neovim
      ;;
  esac
fi

if ! is_exists 'nodebrew'; then
  read -p "Do you wish to install nodebrew? [YyNn]" yn
  case $yn in
    [Yy]* )
      curl -L git.io/nodebrew | perl - setup
      ;;
  esac
fi

if ! is_exists 'the_silver_searcher'; then
  read -p "Do you wish to install the_silver_searcher? [YyNn]" yn
  case $yn in
    [Yy]* )
      brew install the_silver_searcher
      ;;
  esac
fi
