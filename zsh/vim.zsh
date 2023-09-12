## Ctrl-ZでVimとシェルをトグル
## cf. [Vimの生産性を高める12の方法 | 開発手法・プロジェクト管理 | POSTD](http://postd.cc/how-to-boost-your-vim-productivity/)
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# vim:set ft=zsh:
