#!/bin/zsh

if [ -z "$ZDOTDIR" ]; then
  echo 'Define ZDOTDIR!'
  exit 1
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

if [ ! -s "$HOME/.nvm/nvm.sh" ]; then
  read -p "Do you wish to install nvm? [YyNn]" yn
  case $yn in
    [Yy]* )
      curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash
      ;;
  esac
fi

if !is_exists 'ghq'; then
  read -p "Do you wish to install ghq? [YyNn]" yn
  case $yn in
    [Yy]* ) go get https://github.com/motemen/ghq ;;
  esac
fi

if !is_exists 'peco'; then
  read -p "Do you wish to install ghq? [YyNn]" yn
  case $yn in
    [Yy]* ) go get https://github.com/peco/peco ;;
  esac
fi

if !is_exists 'nvim'; then
  read -p "Do you wish to install nvim? [YyNn]" yn
  case $yn in
    [Yy]* )
      brew tap neovim/neovim
      brew install --HEAD neovim
      ;;
  esac
fi
