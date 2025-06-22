export LANG=ja_JP.UTF-8

# Path
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/go/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"
##export MANPATH="/usr/local/man:$MANPATH"

export PATH="$HOME/.bin:$PATH"

# zsh
export ZDOTDIR="$HOME/.zsh"
fpath=($fpath "$ZDOTDIR/zsh/Functions/Chpwd" "$ZDOTDIR/zsh/Functions/Zle")

# Brew
[ -s "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew & Homebrew Cask
# @see [HomebrewとAnsibleでMacの開発環境構築を自動化する | mawatari.jp](http://mawatari.jp/archives/mac-provisioning-by-homebrew-and-ansible)
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Go
# @see [Mac の開発環境構築を自動化する (2015 年初旬編) - t-wadaのブログ](http://t-wada.hatenablog.jp/entry/mac-provisioning-by-ansible)
export GOPATH="$HOME"
export PATH="$PATH:$GOPATH/bin"

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Node.js is managed by mise (see .config/mise/config.toml)
export PATH="$PATH:$HOME/.npm-global/bin"

# pkgconfig
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"

# Flutter
# export PATH="$HOME/flutter/bin:$PATH"

# neovim
export XDG_CONFIG_HOME="$HOME/.config"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Python is managed by mise (see .config/mise/config.toml)
# Poetry is installed via pipx or Homebrew

# pipx
export PATH="$PATH:$HOME/.local/bin"

# sheldon is loaded in .zshrc
# npm global packages are discouraged, use npx or project-local installs
