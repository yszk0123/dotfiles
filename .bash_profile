export PATH

# 自分用のPC限定の設定
if [ -s ~/dotfiles/my_local_mode* ]; then
  PATH=~/.nvm/versions/io.js/v1.8.1/bin:$PATH

  # MacVim
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim '

  # Docker
  export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375
  export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
  export DOCKER_TLS_VERIFY=1

  # Node.js
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
  nvm use iojs
fi

# Git shortcut
# ref:
#   title: 【翻訳】Gitコマンドラインショートカット
#   ref: http://postd.cc/git-command-line-shortcuts/

alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gb='git branch'
alias gbd='git branch -d '
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gd='git diff'
alias gda='git diff HEAD'
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

# Ruby + Ruby on Rails

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Load .bashrc
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
