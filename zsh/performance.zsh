# Performance optimization for zsh startup
# Benchmark zsh startup time with: time zsh -i -c exit

# Skip global compinit for faster startup (sheldon handles this)
skip_global_compinit=1

# Disable compinit security check for faster startup
# Only enable in trusted environments
export ZSH_DISABLE_COMPFIX=true

# Optimize completion loading
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit -d "${ZDOTDIR:-$HOME}/.zcompdump"
else
  compinit -C -d "${ZDOTDIR:-$HOME}/.zcompdump"
fi

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

# gcloud (lazy load)
if command -v gcloud >/dev/null 2>&1; then
  gcloud() {
    unfunction gcloud
    source /opt/homebrew/share/google-cloud-sdk/path.zsh.inc 2>/dev/null || true
    source /opt/homebrew/share/google-cloud-sdk/completion.zsh.inc 2>/dev/null || true
    command gcloud "$@"
  }
fi

# Terraform (lazy load)
if command -v terraform >/dev/null 2>&1; then
  terraform() {
    unfunction terraform
    complete -o nospace -C /opt/homebrew/bin/terraform terraform
    command terraform "$@"
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

# Defer loading of non-essential modules
autoload -Uz add-zsh-hook

# Create a startup benchmark function
zsh_startup_benchmark() {
  echo "Zsh startup benchmark:"
  echo "Run 'time zsh -i -c exit' to measure startup time"
  echo "Target: <200ms for optimal performance"
}

# vim:set ft=zsh: