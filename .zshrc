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

# lib
for name in alias clipboard common complete docker fzf history keybinding lv os prompt ruby python settings utils vcs zaw; do
  source "$HOME/dotfiles/zsh/$name.zsh"
done
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Workaround for GUI app which doesn't get /etc/paths
export PATH="$PATH:$(cat /etc/paths | xargs | tr " " :)"

# vim:set ft=zsh:

# Fuzzy finder
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
