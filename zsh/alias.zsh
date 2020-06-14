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
alias findf='find . \( -path ./.git -o -path \*/node_modules -o -path ./.tmp -o -path ./tmp \) -prune -o -type f -print'
alias findd='find . \( -path ./.git -o -path \*/node_modules -o -path ./.tmp -o -path ./tmp \) -prune -o -type d -print'
alias treei='tree -I ".git|node_modules|bower_components|.tmp|tmp|vendor"'
alias f='fzf --height 40% --reverse'
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

# vim {{{
alias nv='nvim'
alias vi='env LANG=ja_JP.UTF-8 vim '
alias v='env LANG=ja_JP.UTF-8 vim '
# }}}

# 上書き確認 {{{
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# }}}

#alias mkdir='mkdir -p'

# Wrap tmux to avoid issues with environment loading
alias tmux='direnv exec / tmux'

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

# dokku {{{
alias dokku='bash $HOME/src/github.com/dokku/dokku/contrib/dokku_client.sh'
# }}}

# {{{
# cf. https://github.com/necojackarc/dotfiles/commit/dacaf426f834bb9ae47e25d3af2b514a0115f87b

# cd to a repo listed with ghq using fzf
function cdr {
  local dir="$(ghq list -p | fzf)"
  if [ ! -z "$dir" ] ; then
    cd "$dir"
  fi
}

# git checkout a branch using fzf
function gcob {
  local branch="$( git branch | sed s/\*/\ /g | awk '{ print $1 }' | fzf)"
  if [ ! -z "$branch" ] ; then
    git checkout "$branch"
  fi
}
# }}}

# vim:set ft=zsh:
