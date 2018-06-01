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
rbenv init - | source

# ------------------------------------------------------------------------------
# Keybindings
# ------------------------------------------------------------------------------

function fish_user_key_bindings
  # peco
  bind \cr 'peco_select_history (commandline -b)'
  bind \cx\ck peco_kill
  bind \cg peco_recentd
  bind \c] peco_select_ghq_repository

  # cf. https://github.com/fish-shell/fish-shell/wiki/Bash-Style-Command-Substitution-and-Chaining-(!!-!$-&&-%7C%7C)#getting--and-
  bind "&&" 'commandline -i "; and"'
  bind "||" 'commandline -i "; or"'
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
