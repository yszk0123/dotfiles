# OS 別の設定
case ${OSTYPE} in
  darwin*)
    #Mac用の設定
    export CLICOLOR=1
    alias ls='ls -G -F'
    vcd() { vi -c "cd $@" }
    ;;
  linux*)
    #Linux用の設定
    alias ls='ls -F --color=auto'
    vcd() { vim -c "cd $@" }
    ;;
esac

# vim:set ft=zsh:
