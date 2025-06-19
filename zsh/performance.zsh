# Performance optimization for zsh startup
# Benchmark zsh startup time with: time zsh -i -c exit

# Disable compinit security check for faster startup
# Only enable in trusted environments
export ZSH_DISABLE_COMPFIX=true

# Lazy loading for heavy commands
# Git
if command -v git >/dev/null 2>&1; then
  # Defer git status checks in prompt
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWSTASHSTATE=1
  export GIT_PS1_SHOWUNTRACKEDFILES=1
fi

# Docker (lazy load)
if [[ -f ~/.docker/config.json ]] && command -v docker >/dev/null 2>&1; then
  docker() {
    unfunction docker
    command docker "$@"
  }
fi

# kubectl (lazy load)
if command -v kubectl >/dev/null 2>&1; then
  kubectl() {
    unfunction kubectl
    source <(command kubectl completion zsh)
    command kubectl "$@"
  }
fi

# AWS CLI (lazy load)
if command -v aws >/dev/null 2>&1; then
  aws() {
    unfunction aws
    complete -C '/opt/homebrew/bin/aws_completer' aws
    command aws "$@"
  }
fi

# Optimize PATH - remove duplicates
typeset -U path PATH
path=(
  $HOME/.local/bin
  $HOME/dotfiles/bin
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /usr/local/bin
  /usr/local/sbin
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  $path
)

# Reduce history file I/O
export HISTSIZE=50000
export SAVEHIST=50000
export HISTFILE=~/.zsh_history

# vim:set ft=zsh: