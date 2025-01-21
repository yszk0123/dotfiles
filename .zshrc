# Powerlevel10k
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
source_zsh_script history
source_zsh_script keybinding
source_zsh_script os
source_zsh_script settings
source_zsh_script alias
source_zsh_script git
source_zsh_script mise
# source_zsh_script fzf
# source_zsh_script vim
# source_zsh_script python

# Autosuggestions
# source_if_exists "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
# if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/google-cloud-sdk/path.zsh.inc"; fi
# if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# Bun
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# sheldon
eval "$(sheldon source)"

# Powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh

# pipx
export PATH="$PATH:$HOME/.local/bin"

# Brew
# if [ -f "$(brew --prefix)/etc/brew-wrap" ]; then
#   source "$(brew --prefix)/etc/brew-wrap"
# fi

# npm
# export PATH="$PATH:$(npm prefix --location=global)/bin"

if is_exists "/opt/homebrew/bin/mise"; then
  eval "$(/opt/homebrew/bin/mise activate zsh)"
fi
if is_exists "$HOME/.local/bin/mise"; then
  eval "$($HOME/.local/bin/mise activate zsh)"
fi
# vim:set ft=zsh:
# bun completions

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
