# ------------------------------------------------------------------------------
# Basic
# ------------------------------------------------------------------------------

# Language
set -x LANG ja_JP.UTF-8

# Alias
source $HOME/.config/fish/alias.fish

# Environment variables
source $HOME/.config/fish/env.fish

# direnv
eval (direnv hook fish)

# rbenv
# rbenv init - | source

# ------------------------------------------------------------------------------
# Keybindings
# ------------------------------------------------------------------------------

function fish_user_key_bindings
  # peco

  bind \cr 'peco_select_history (commandline -b)'
  bind \cx\ck peco_kill
  bind \cg peco_recentd
  bind \c] peco_select_ghq_repository
end

# ------------------------------------------------------------------------------
# Plugins
# ------------------------------------------------------------------------------

# Ensure fisherman and plugins are installed
if not test -f $HOME/.config/fish/functions/fisher.fish
  echo "==> Fisherman not found. Installing..."
  curl -sLo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  fisher
end

# refs. https://github.com/moovweb/gvm/issues/137#issuecomment-131400212
function gvm
  bass source ~/.gvm/scripts/gvm ';' gvm $argv
end

# refs. https://github.com/golang/go/wiki/SettingGOPATH
function gvmu
  gvm use $argv[1]; or return
  export GOPATH=$HOME
end
