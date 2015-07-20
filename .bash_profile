# Helper
function is_exists() {
  type "$1" >/dev/null 2>&1
  return $?
}

# Path
export PATH="~/.rbenv/shims:~/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/go/bin:/Library/TeX/texbin"
##export MANPATH="/usr/local/man:$MANPATH"

# Homebrew & Homebrew Cask
## ref: [HomebrewとAnsibleでMacの開発環境構築を自動化する | mawatari.jp](http://mawatari.jp/archives/mac-provisioning-by-homebrew-and-ansible)
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# 自分用のPC限定の設定
if [ -s ~/dotfiles/my_local_mode ]; then
  # MacVim
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim '
fi

# Docker
## if is_exists "boot2docker"; then
##   export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375
##   export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
##   export DOCKER_TLS_VERIFY=1
## fi

# Node.js & brew
export NVM_DIR=~/.nvm
if [ -s ~/dotfiles/my_local_mode ] && is_exists "brew"; then
  export NVM_DIR=$(brew --prefix nvm)
  PATH=/usr/local/Cellar:$PATH
fi

if [ -s $NVM_DIR/nvm.sh ]; then
  source $NVM_DIR/nvm.sh
  nvm use iojs

  # Enable tab-completion
  . <(npm completion)
  # [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
fi

# Alias
alias la='ls -a'
alias ll='ls -l'

## ghq & peco
alias ghqp='cd $(ghq list -p | peco)'
alias ghqp-open='gh-open $(ghq list -p | peco)'

## 上書き確認
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

##alias mkdir='mkdir -p'

## Git
### ref: [【翻訳】Gitコマンドラインショートカット](http://postd.cc/git-command-line-shortcuts/)
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
if is_exists "rbenv"; then
  eval "$(rbenv init -)"
fi

# Go
## ref: [Mac の開発環境構築を自動化する (2015 年初旬編) - t-wadaのブログ](http://t-wada.hatenablog.jp/entry/mac-provisioning-by-ansible)
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

# Load .bashrc
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# lvの設定
## ref: [おすすめzsh設定 - ククログ(2011-09-05)](http://www.clear-code.com/blog/2011/9/5.html)

if type lv > /dev/null 2>&1; then
    ## lvを優先する。
    export PAGER="lv"
else
    ## lvがなかったらlessを使う。
    export PAGER="less"
fi

if [ "$PAGER" = "lv" ]; then
    ## -c: ANSIエスケープシーケンスの色付けなどを有効にする。
    ## -l: 1行が長くと折り返されていても1行として扱う。
    ##     （コピーしたときに余計な改行を入れない。）
    export LV="-c -l"
else
    ## lvがなくてもlvでページャーを起動する。
    alias lv="$PAGER"
fi

# vim:set ft=zsh:
