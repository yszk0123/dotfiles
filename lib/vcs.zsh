# VCS全般 {{{
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
 
zstyle ':vcs_info:*' formats '%F{green}[%s:%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}[%s:%b|%a]%f'
 
function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg
# }}}

# git {{{
### ref: [【翻訳】Gitコマンドラインショートカット](http://postd.cc/git-command-line-shortcuts/)
alias ga='git add'
alias gaa='git add .'
alias gaA='git add -A'
alias gb='git branch'
alias gbd='git branch -d '
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gd='git diff'
alias gdH='git diff HEAD'
alias gdH1='git diff HEAD~'
alias gi='git init'
alias glo='git log'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gp='git pull'
alias gss='git status -s'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'
# }}}

# vim:set ft=zsh:
