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
# Format (pretty print)
alias grepf='grep --color=always'
alias agf='ag --group --color'
# }}}

# ghq & peco {{{
alias ghqp='cd $(ghq list -p | peco)'
alias ghqp-open='gh-open $(ghq list -p | peco)'
# }}}

# npm {{{
alias ni='npm install'
alias nis='npm install --save'
alias nid='npm install --save-dev'
alias nig='npm install --global'
alias nt='npm test'
alias nit='npm install && npm test'
alias nr='npm run'
# }}}

# vim {{{
alias nv='nvim'
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

# vim:set ft=zsh: