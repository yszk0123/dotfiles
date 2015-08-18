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
