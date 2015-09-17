# Directory aliases {{{
# cf. [その他のオプションの調べ方](http://qiita.com/uasi/items/c4288dd835a65eb9d709#1-5)
# cd ~abc => /a/b/c
# hash -d abc=/a/b/c
hash -d D=~/Dropbox
hash -d Dg=~/Dropbox/git
hash -d d=~/dotfiles
hash -d sD=~/src/Dropbox
hash -d sG=~/src/gist.github.com
hash -d sg=~/src/github.com
hash -d sp=~/src/gitlab.pixta.jp
# }}}

# {{{
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -lA'
alias pu='pushd'
alias po='popd'
# }}}

# {{{
alias nv='nvim'
# }}}

# ghq & peco {{{
alias ghqp='cd $(ghq list -p | peco)'
alias ghqp-open='gh-open $(ghq list -p | peco)'
# }}}

# 上書き確認 {{{
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# }}}

#alias mkdir='mkdir -p'

# Global aliases {{{
alias -g G='| grep'
alias -g L='| less'
alias -g P='| perl -nle'
alias -g S='| sed'
# }}}

# vim:set ft=zsh:
