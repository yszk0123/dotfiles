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
      mkdir -p ~/.tmux/plugins
      git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
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

# cf. https://github.com/neovim/homebrew-neovim/blob/master/README.md
if ! is_exists 'nvim'; then
  read -p "Do you wish to install nvim? [YyNn]" yn
  case $yn in
    [Yy]* )
      brew tap neovim/neovim
      brew install --HEAD neovim
      ;;
  esac
else
  read -p "Do you wish to update nvim? [YyNn]" yn
  case $yn in
    [Yy]* )
      brew update
      brew upgrade neovim
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

# cf. https://github.com/stevemao/diff-so-fancy
if ! is_exists 'diff-so-fancy'; then
  read -p "Do you wish to install diff-so-fancy? [YyNn]" yn
  case $yn in
    [Yy]* )
      npm install -g diff-so-fancy
      ;;
  esac
fi

if ! is_exists 'fzf'; then
  read -p "Do you wish to install fzf? [YyNn]" yn
  case $yn in
    [Yy]* )
      git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
      ~/.fzf/install
      ;;
  esac
fi

if [ ! -s "$HOME/.vim/autoload/plug.vim" ]; then
  read -p "Do you wish to install plug.vim? [YyNn]" yn
  case $yn in
    [Yy]* )
      curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      ;;
  esac
fi

# cf. [p-e-w/maybe: :rabbit2: See what a program does before deciding whether you really want it to happen.](https://github.com/p-e-w/maybe)
if ! is_exists 'maybe'; then
  read -p "Do you wish to install maybe? [YyNn]" yn
  case $yn in
    [Yy]* )
      pip install maybe || pip3 install maybe
      ;;
  esac
fi
