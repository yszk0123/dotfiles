# git {{{
### cf. [【翻訳】Gitコマンドラインショートカット](http://postd.cc/git-command-line-shortcuts/)
### cf. https://github.com/GitAlias/gitalias
# Aliases {{{
alias g=git
alias ga='git add'
alias gaA='git add -A'
alias gau='git add -u'
alias ge='git exec '

alias gb='git branch'
alias gbd='git branch -d '

alias gc='git commit'
alias gca='git commit --amend'
alias gcaar='git commit -a --amend --reuse-message=HEAD'
alias gcar='git commit --amend --reuse-message=HEAD'
alias gcm='git commit -m'
alias gcp='git commit --patch'

alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'

alias gd='git diff --color'
alias gdh1='git diff --color "HEAD^"'
alias gdh='git diff --color HEAD'
alias gds='git diff --stat --color'
alias gdsh1='git diff --stat --color "HEAD^"'
alias gdsh='git diff --stat --color HEAD'
alias gdst='git diff --staged --color'

alias gf='git fetch origin'

alias gl='git log --pretty=format:"%C(yellow)%h %Cblue%ad %Creset%s" --date=short --all'
alias glg='git log --graph --oneline --decorate --all --color'
alias gll='git log --color'
alias gls='git ls-files'
alias glsi='git ls-files --others --i --exclude --standard'

alias gs='git status'
alias gss='git status -s'

alias gst='git stash'
alias gsta='git stash apply'
alias gstdrop='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show'

alias gm='git merge'
alias gpic='git cherry-pick'
alias gpul='git pull origin '
alias gpus='git push -u origin '
alias gpusforce='git push --force-with-lease -u origin '
alias greb='git rebase'
alias grebi='git rebase -i'
alias gref='git reflog'
alias gres='git reset'
alias grev='git revert'
alias gt='git tag'
# }}}

# vim:set ft=zsh:
