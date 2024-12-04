# git {{{
### cf. [【翻訳】Gitコマンドラインショートカット](http://postd.cc/git-command-line-shortcuts/)
### cf. https://github.com/GitAlias/gitalias
# Aliases {{{
alias g=git
alias ga='git add'
alias gau='git add -u'
alias ge='git exec '
alias gaab='git add -u && git absorb --base $(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@")'

alias gb='git branch'

alias gc='git commit'
alias gca='git commit --amend'
alias gcar='git commit --amend --reuse-message=HEAD'

alias gco='git checkout'

alias gd='git diff --color'
alias gds='git diff --stat --color'
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
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show'

alias gcp='git cherry-pick'

alias gm='git merge'
alias gpul='git pull origin '
alias gpus='git push -u origin '
alias gpusforce='git push --force-with-lease -u origin '
alias greb='git rebase'
alias grebi='git rebase -i'
alias gres='git reset'
# }}}

# vim:set ft=zsh:
