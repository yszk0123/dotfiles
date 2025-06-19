# Set default editor
if command -v nvim >/dev/null 2>&1; then
  export EDITOR=nvim
  export VISUAL=nvim
  alias vim=nvim
  alias vi=nvim
elif command -v vim >/dev/null 2>&1; then
  export EDITOR=vim
  export VISUAL=vim
  alias vi=vim
fi

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
