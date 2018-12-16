source ~/dotfiles/scripts/common/utils.sh

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
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
    zgen oh-my-zsh

    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/fzf
    zgen oh-my-zsh plugins/yarn
    zgen oh-my-zsh plugins/command-not-found

    zgen load zsh-users/zsh-syntax-highlighting
    zgen load "zsh-users/zsh-completions"

    zgen save
fi
# }}}

# Lib
# Disabled: python ruby
for name in common complete docker fzf history keybinding lv os prompt settings utils zaw alias clipboard vcs; do
  source "$HOME/dotfiles/zsh/$name.zsh"
done

source_if_exists "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

# vim:set ft=zsh:
