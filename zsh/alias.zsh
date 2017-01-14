# Directory aliases {{{
# cf. [その他のオプションの調べ方](http://qiita.com/uasi/items/c4288dd835a65eb9d709#1-5)
# cd ~abc => /a/b/c
# hash -d abc=/a/b/c
hash -d D=~/Dropbox
hash -d G=~/google-drive
hash -d dot=~/dotfiles
hash -d gist=~/src/gist.github.com
hash -d hub=~/src/github.com
hash -d lab=~/src/gitlab.com
hash -d labp=~/src/gitlab.pixta.jp
hash -d ssh=~/.ssh
# }}}

# {{{
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -lA'
alias pu='pushd'
alias po='popd'
alias findi='find . \( -path ./.git -o -path \*/node_modules -o -path ./.tmp -o -path ./tmp \) -prune -o -type d -print'
alias treei='tree -I ".git|node_modules|bower_components|.tmp|tmp|vendor"'
# Format (pretty print) {{{
alias grepf='grep --color=always'
alias agf='ag --group --color'
# }}}
# }}}

# docker {{{
alias d='docker'
alias de='docker exec'
alias dc='docker-compose'
alias dcb='docker-compose build'
alias dcr='docker-compose run --rm'
alias dcu='docker-compose up'
# }}}

# ghq & peco {{{
alias ghqp='cd $(ghq list -p | peco)'
alias ghqp-open='gh-open $(ghq list -p | peco)'
# }}}

# vim {{{
alias nv='nvim'
alias vi='env LANG=ja_JP.UTF-8 vim ADDITIONAL_VIM_PLUGINS=1 '
alias v='env LANG=ja_JP.UTF-8 vim '
# }}}

# 上書き確認 {{{
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# }}}

#alias mkdir='mkdir -p'

# Global aliases {{{
alias -g G0='| grep'
alias -g L0='| less'
alias -g P='| perl -nle'
alias -g S='| sed'
# Format (pretty print)
alias -g G='| grep --color=always'
alias -g L="| less --tabs=1,5 -R"
alias -g D="| diff-so-fancy | less --tabs=1,5 -R"
# }}}

if is_exists "hub"; then
  alias git=hub
fi

# vim:set ft=zsh:
