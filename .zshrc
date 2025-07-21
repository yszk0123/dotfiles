# Starship prompt initialization (installed via Homebrew)
# Note: starship is used instead of powerlevel10k for consistency

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
# Load performance optimizations first
source_zsh_script performance

# Core modules
source_zsh_script common
source_zsh_script settings
source_zsh_script history

# Interactive modules (defer loading when possible)
source_zsh_script complete
source_zsh_script keybinding
source_zsh_script alias

# Development tools
source_zsh_script git
source_zsh_script mise
source_zsh_script vim

# OS-specific optimizations
source_zsh_script os

# Optional modules (enable as needed):
# source_zsh_script fzf    # Enable if using fzf integration
# source_zsh_script python # Deprecated - Python managed by mise

# Legacy configurations (managed by sheldon now):
# - zsh-autosuggestions: managed via sheldon plugins
# - google-cloud-sdk: install manually if needed

# Bun (defer loading)
if [ -d "$HOME/.bun" ]; then
  [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
fi

# direnv integration
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# sheldon (zsh plugin manager) - defer loading
if command -v sheldon >/dev/null 2>&1; then
  eval "$(sheldon source)"
fi

# starship prompt (modern cross-shell prompt) - defer loading
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# pipx
export PATH="$PATH:$HOME/.local/bin"

# Package manager configurations:
# - Homebrew: managed via Brewfile
# - npm: global packages installed as needed
# - mise: handles Node.js and Python versions

if is_exists "/opt/homebrew/bin/mise"; then
  eval "$(/opt/homebrew/bin/mise activate zsh)"
fi
if is_exists "$HOME/.local/bin/mise"; then
  eval "$($HOME/.local/bin/mise activate zsh)"
fi

if command -v gwq >/dev/null 2>&1; then
  source <(gwq completion zsh)
fi

# vim:set ft=zsh:
# bun completions
