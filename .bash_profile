function is_exists() {
  type "$1" >/dev/null 2>&1
  return $?
}

export PATH

# 自分用のPC限定の設定
if [ -s ~/dotfiles/my_local_mode ]; then
  # MacVim
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim '
fi

# Docker
# if is_exists "boot2docker"; then
#   export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375
#   export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
#   export DOCKER_TLS_VERIFY=1
# fi

# Node.js
export NVM_DIR=~/.nvm
if [ -s ~/dotfiles/my_local_mode ] && [ is_exists "brew" ]; then
  export NVM_DIR=$(brew --prefix nvm)
fi

if [ -s $NVM_DIR/nvm.sh ]; then
  source $NVM_DIR/nvm.sh
  nvm use iojs
  # [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
fi

# Git shortcut
# ref:
#   title: 【翻訳】Gitコマンドラインショートカット
#   ref: http://postd.cc/git-command-line-shortcuts/

if is_exists "git"; then
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
fi

# Ruby + Ruby on Rails

export PATH="$HOME/.rbenv/bin:$PATH"
if is_exists "rbenv"; then
  eval "$(rbenv init -)"
fi

# Load .bashrc
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
