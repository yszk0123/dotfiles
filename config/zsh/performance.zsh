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
  $HOME/bin
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

# Create a startup benchmark function with automated testing
zsh_startup_benchmark() {
  echo "Zsh startup benchmark:"
  echo "===================="
  
  # Run multiple benchmarks and calculate average
  local total_time=0
  local runs=5
  local temp_file=$(mktemp)
  
  echo "Running $runs benchmark tests..."
  
  for i in $(seq 1 $runs); do
    local start_time=$(python3 -c "import time; print(time.time())")
    zsh -i -c 'exit' 2>/dev/null
    local end_time=$(python3 -c "import time; print(time.time())")
    local duration=$(python3 -c "print(f'{($end_time - $start_time) * 1000:.1f}')")
    
    echo "Run $i: ${duration}ms"
    total_time=$(python3 -c "print($total_time + $duration)")
  done
  
  local avg_time=$(python3 -c "print(f'{$total_time / $runs:.1f}')")
  
  echo "===================="
  echo "Average startup time: ${avg_time}ms"
  
  if (( $(python3 -c "print(1 if $avg_time < 200 else 0)") )); then
    echo "✅ Performance: Excellent (< 200ms)"
  elif (( $(python3 -c "print(1 if $avg_time < 500 else 0)") )); then
    echo "⚡ Performance: Good (< 500ms)"
  elif (( $(python3 -c "print(1 if $avg_time < 1000 else 0)") )); then
    echo "⚠️  Performance: Fair (< 1000ms)"
  else
    echo "🐌 Performance: Needs optimization (> 1000ms)"
  fi
  
  echo ""
  echo "Performance tips:"
  echo "- Use lazy loading for heavy commands"
  echo "- Minimize plugin count"
  echo "- Check completion cache freshness"
  echo "- Profile with: zsh -xvs"
  
  rm -f "$temp_file"
}

# Automatic performance monitoring on shell startup (optional)
# Uncomment to enable automatic benchmarking
# if [[ -z "$ZSH_STARTUP_BENCHMARK_DONE" ]]; then
#   export ZSH_STARTUP_BENCHMARK_DONE=1
#   # Only benchmark occasionally to avoid slowing down regular usage
#   if (( RANDOM % 50 == 0 )); then
#     echo "🔄 Running automatic startup benchmark..."
#     zsh_startup_benchmark
#   fi
# fi

# Create alias for easy access
alias zsh-bench='zsh_startup_benchmark'

# vim:set ft=zsh:
