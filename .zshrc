source "$HOME/dotfiles/scripts/common/utils.sh"

function source_zsh_script() {
  local name="$1"
  source "$HOME/dotfiles/zsh/$name.zsh"
}

# Language
## 日本語ファイル名を表示可能にする
setopt print_eight_bit

# 単語の区切り文字を指定
autoload -Uz select-word-style
select-word-style default
## ここで指定した文字は単語区切りとみなされる
## / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# Workaround for GUI app which doesn't get /etc/paths
export PATH="$PATH:$(cat /etc/paths | xargs | tr " " :)"

# Plugins {{{
ZGEN_AUTOLOAD_COMPINIT=0
ZGEN_DIR="$ZDOTDIR/.zgen"
source "$ZGEN_DIR/zgen.zsh"

if ! zgen saved; then
  zgen oh-my-zsh

  # Maybe slow...
  # zgen oh-my-zsh plugins/command-not-found

  zgen oh-my-zsh plugins/fzf
  # Dangerous!!!
  # zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/gitignore
  zgen oh-my-zsh plugins/tmux
  zgen oh-my-zsh plugins/yarn

  zgen load zsh-users/zsh-syntax-highlighting

  zgen save
fi
# }}}

# Lib
source_zsh_script common
source_zsh_script complete
source_zsh_script fzf
source_zsh_script history
source_zsh_script keybinding
source_zsh_script os
source_zsh_script settings
source_zsh_script utils
source_zsh_script alias
source_zsh_script git
# source_zsh_script python

if [ -f "$(brew --prefix)/etc/brew-wrap" ]; then
  source "$(brew --prefix)/etc/brew-wrap"
fi

source_if_exists "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

eval "$(starship init zsh)"

# vim:set ft=zsh:
