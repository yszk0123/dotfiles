# OS 別の設定
case ${OSTYPE} in
  darwin*)
    #Mac用の設定
    export CLICOLOR=1
    alias ls='ls -G -F'
    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim '
    alias v='env REDUCE_VIM_PLUGINS=1 LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim '
    vcd() { vi -c "cd $@" }
    ;;
  linux*)
    #Linux用の設定
    alias ls='ls -F --color=auto'
    vcd() { vim -c "cd $@" }
    ;;
esac

# vim:set ft=zsh:
