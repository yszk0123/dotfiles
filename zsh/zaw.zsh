# chpwd_recent_dirs {{{
# cf. [chpwd_recent_dirs](http://blog.n-z.jp/blog/2013-11-12-zsh-cdr.html)
# zstyle ':completion:*' menu select
# zstyle ':completion:*:cd:*' ignore-parents parent pwd
# zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

# if is-at-least 4.3.11; then
# if [[ -n $(echo $fpath/chpwd_recent_dirs) && -n $(echo $fpath/cdr) ]]; then
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ":chpwd:*" recent-dirs-max 500
zstyle ":chpwd:*" recent-dirs-default true
zstyle ":completion:*" recent-dirs-insert both
# }}}

# zaw {{{
source $ZDOTDIR/zaw/zaw.zsh

zstyle ':filter-select:highlight' selected fg=black,bg=cyan,standout
zstyle ':filter-select' case-insensitive yes

bindkey '^G' zaw-cdr
bindkey '^R' zaw-history
bindkey '^X^F' zaw-git-files
bindkey '^X^B' zaw-git-branches
bindkey '^X^P' zaw-process
bindkey '^T' zaw-tmux
# }}}

# vim:set ft=zsh:
