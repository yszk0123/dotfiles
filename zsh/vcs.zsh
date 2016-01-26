# git {{{
### cf. [【翻訳】Gitコマンドラインショートカット](http://postd.cc/git-command-line-shortcuts/)
# Aliases {{{
alias ga='git add'
alias gau='git add -u'
alias gaA='git add -A'
alias gb='git branch'
alias gbd='git branch -d '
alias gc='git commit'
alias gca='git commit --amend'
alias gcar='git commit --amend --reuse-message=HEAD'
alias gcaar='git commit -a --amend --reuse-message=HEAD'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcp='git commit --patch'
alias gd='git diff'
alias gds='git diff --stat'
alias gdsh1='git diff --stat HEAD~'
alias gdsh='git diff --stat HEAD'
alias gdh1='git diff HEAD~'
alias gdh='git diff HEAD'
alias gi='git init'
alias gl='git log --pretty=format:"%C(yellow)%h %Cblue%ad %Creset%s" --date=short --all'
alias glg='git log --graph --oneline --decorate --all'
alias gll='git log'
alias gref='git reflog'
alias gm='git merge'
alias gpic='git cherry-pick'
alias gpul='git pull'
alias gpus='git push'
alias greb='git rebase'
alias grebi='git rebase -i'
alias gres='git reset'
alias grev='git revert'
alias grem='git remote'
alias gs='git status'
alias gss='git status -s'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show'
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
