export LANG=ja_JP.UTF-8

# Path
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/go/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"
##export MANPATH="/usr/local/man:$MANPATH"

# zsh
export ZDOTDIR="$HOME/.zsh"
fpath=($fpath "$ZDOTDIR/zsh/Functions/Chpwd" "$ZDOTDIR/zsh/Functions/Zle")

# Homebrew & Homebrew Cask
# @see [HomebrewとAnsibleでMacの開発環境構築を自動化する | mawatari.jp](http://mawatari.jp/archives/mac-provisioning-by-homebrew-and-ansible)
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Go
# @see [Mac の開発環境構築を自動化する (2015 年初旬編) - t-wadaのブログ](http://t-wada.hatenablog.jp/entry/mac-provisioning-by-ansible)
export GOPATH="$HOME"
export PATH="$PATH:$GOPATH/bin"

# Python
# export PATH="$HOME/.pyenv/bin:$PATH"
# export PATH="$HOME/.poetry/bin:$PATH"
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# nodebrew
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# pkgconfig
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"

# Let npm packages maintain as dotfiles and expose as well as global packages
export PATH="$HOME/dotfiles/node_modules/.bin:$PATH"

# Flutter
export PATH="$HOME/flutter/bin:$PATH"

# neovim
export XDG_CONFIG_HOME="$HOME/.config"

# Rust

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -s "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

[ -s "${HOME}/.zgen/zgen.sh" ] && source "${HOME}/.zgen/zgen.zsh"
[ -s "${HOME}/.zsh/.zgen/zgen.sh" ] && source "${HOME}/.zsh/.zgen/zgen.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
