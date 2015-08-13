# 自分用のPC限定の設定
export NVM_DIR=~/.nvm
if [ -s ~/dotfiles/my_local_mode ] && is_exists "brew"; then
  export NVM_DIR=$(brew --prefix nvm)
  PATH=/usr/local/Cellar:$PATH
fi

if [ -s $NVM_DIR/nvm.sh ]; then
  source $NVM_DIR/nvm.sh
  nvm use iojs

  # Enable tab-completion
  . <(npm completion)
  # [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
fi

# vim:set ft=zsh:
