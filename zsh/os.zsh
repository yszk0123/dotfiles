# OS 別の設定
case ${OSTYPE} in
  darwin*)
    #Mac用の設定
    export CLICOLOR=1
    alias ls='ls -G -F'
    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim '
    ;;
  linux*)
    #Linux用の設定
    alias ls='ls -F --color=auto'
    ;;
esac

# vim:set ft=zsh:
