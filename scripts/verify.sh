#!/bin/bash
source "$HOME/dotfiles/scripts/common/utils.sh"

echo_color "=== System Verification ===" "34"

# Check essential tools
check_command() {
  local cmd="$1"
  local name="${2:-$cmd}"
  
  if command -v "$cmd" >/dev/null 2>&1; then
    echo_color "✓ $name: $(command -v "$cmd")" "32"
    return 0
  else
    echo_color "✗ $name: not found" "31"
    return 1
  fi
}

echo_color "\n--- Essential Tools ---" "33"
check_command "git" "Git"
check_command "nvim" "Neovim"
check_command "zsh" "Zsh"
check_command "starship" "Starship"
check_command "mise" "Mise"
check_command "sheldon" "Sheldon"

echo_color "\n--- Development Tools ---" "33"
check_command "node" "Node.js"
check_command "npm" "npm"
check_command "python3" "Python"
check_command "pip3" "pip"
check_command "go" "Go"

echo_color "\n--- CLI Tools ---" "33"
check_command "gh" "GitHub CLI"
check_command "fzf" "fzf"
check_command "rg" "ripgrep"
check_command "bat" "bat"
check_command "eza" "eza"

echo_color "\n--- Version Information ---" "33"
if command -v node >/dev/null 2>&1; then
  echo "Node.js: $(node --version)"
fi
if command -v python3 >/dev/null 2>&1; then
  echo "Python: $(python3 --version)"
fi
if command -v go >/dev/null 2>&1; then
  echo "Go: $(go version | cut -d' ' -f3)"
fi
if command -v nvim >/dev/null 2>&1; then
  echo "Neovim: $(nvim --version | head -1)"
fi

echo_color "\n--- Configuration Files ---" "33"
check_file() {
  local file="$1"
  local name="${2:-$file}"
  
  if [[ -f "$file" ]] || [[ -L "$file" ]]; then
    echo_color "✓ $name" "32"
    return 0
  else
    echo_color "✗ $name: not found" "31"
    return 1
  fi
}

check_file "$HOME/.zshrc" "Zsh config"
check_file "$HOME/.config/nvim/init.vim" "Neovim init.vim"
check_file "$HOME/.config/nvim/init.lua" "Neovim init.lua"
check_file "$HOME/.config/starship.toml" "Starship config"
check_file "$HOME/.config/mise/config.toml" "Mise config"
check_file "$HOME/.config/sheldon/plugins.toml" "Sheldon config"

echo_color "\n--- Environment Variables ---" "33"
echo "EDITOR: ${EDITOR:-not set}"
echo "VISUAL: ${VISUAL:-not set}"
echo "ZDOTDIR: ${ZDOTDIR:-not set}"
echo "XDG_CONFIG_HOME: ${XDG_CONFIG_HOME:-not set}"

echo_color "\n--- Mise Tools ---" "33"
if command -v mise >/dev/null 2>&1; then
  mise list
else
  echo_color "Mise not available" "31"
fi

echo_color "\nVerification complete!" "32"