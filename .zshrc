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
ZGEN_AUTOLOAD_COMPINIT=0
ZGEN_DIR="$ZDOTDIR/.zgen"
source "$ZGEN_DIR/zgen.zsh"

# Load zgen only if a user types a zgen command
# ref: https://github.com/tarjoilija/zgen/issues/92
# zgen () {
#   if [[ ! -s "$ZDOTDIR/.zgen/zgen.zsh" ]]; then
#     git clone --recursive https://github.com/tarjoilija/zgen.git "$ZDOTDIR/.zgen"
#   fi
#   source "$ZDOTDIR/.zgen/zgen.zsh"
#   zgen "$@"
# }

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
# Disabled: python ruby
for name in common complete docker fzf history keybinding lv os prompt settings utils alias clipboard vcs; do
  source "$HOME/dotfiles/zsh/$name.zsh"
done

if [ -f $(brew --prefix)/etc/brew-wrap ]; then
  source $(brew --prefix)/etc/brew-wrap
fi

source_if_exists "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

# vim:set ft=zsh:
