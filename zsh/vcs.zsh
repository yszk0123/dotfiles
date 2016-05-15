# git {{{
### cf. [【翻訳】Gitコマンドラインショートカット](http://postd.cc/git-command-line-shortcuts/)
# Aliases {{{
alias ga='git add'
alias gaA='git add -A'
alias gau='git add -u'

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
alias gdst='git diff --color --staged'

alias gl='git log --pretty=format:"%C(yellow)%h %Cblue%ad %Creset%s" --date=short --all'
alias glg='git log --graph --oneline --decorate --all --color'
alias gll='git log --color'

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
alias gpul='git pull'
alias gpus='git push'
alias gpusforce='git push --force-with-lease'
alias greb='git rebase'
alias grebi='git rebase -i'
alias gref='git reflog'
alias gres='git reset'
alias grev='git revert'
alias gt='git tag'
# }}}

# Advanced shortcuts {{{
# cf. [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles/blob/master/.gitconfig)
# Find branches containing commit
gfb() { git branch -a --contains "$1" }

# Find tags containing commit
gft() { git describe --always --contains "$1" }

# Find commits by source code
gfc() { git log --pretty=format:'%C(yellow)%h %Cblue%ad  %Creset%s %Cgreen%cn %Cred%d' --decorate --date=short -S"$1" }

# Find commits by commit message
gfm() { git log --pretty=format:'%C(yellow)%h %Cblue%ad  %Creset%s %Cgreen%cn %Cred%d' --decorate --date=short --grep="$1" }

# Interactive rebase with the given number of latest commits
grebn() { git rebase -i HEAD~$1 }
# }}}
# }}}

# vim:set ft=zsh:
