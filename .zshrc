source "$HOME/dotfiles/scripts/common/utils.sh"

: "${ZDOTDIR:=~/.zsh}"

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
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

source_if_exists "$(brew --prefix asdf)/libexec/asdf.sh"

eval "$(starship init zsh)"

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/yszk0123/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/yszk0123/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/yszk0123/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/yszk0123/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<
# 
# export PATH="/Users/yszk0123/miniconda3/bin:$PATH"

# vim:set ft=zsh:
