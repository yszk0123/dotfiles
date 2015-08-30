# 自分用のPC限定の設定
export NVM_DIR=~/.nvm

if [ -s "$HOME/dotfiles/my_local_mode" ] && is_exists "brew"; then
  export NVM_DIR=$(brew --prefix nvm)
  PATH="/usr/local/Cellar:$PATH"
fi

if [ -s "$NVM_DIR/nvm.sh" ]; then
  function load_node() {
    unset -f nvm
    unset -f npm
    unset -f node
    echo 'Loading nvm/npm/node...'

    source "$NVM_DIR/nvm.sh"
    nvm use iojs

    # Enable tab-completion
    [[ -f "$NVM_DIR/bash_completion" ]] && . "$NVM_DIR/bash_completion"
    . <(npm completion)
  }

  nvm() { load_node; nvm "$@"; }
  npm() { load_node; npm "$@"; }
  node() { load_node; node "$@"; }

  alias -g N="| node -r $HOME/dotfiles/lib/oneline-helper.js -e"
fi

# vim:set ft=zsh:
