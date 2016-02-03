function _find_file() {
  for env_file in $@; do
    if [ -s $env_file ]; then
      echo -n "$env_file"
      return
    fi
  done
}

# FIXME: this function cannot recognize aliases
function load_env_locally() {
  local env_file=$(_find_file .env_local .env)
  if [ -n "$env_file" ]; then
    env $(cat $env_file | grep "=" | xargs) "$@"
  else
    env "$@"
  fi
}

alias lenv=load_env_locally
alias le=load_env_locally

# direnv
if is_exists "direnv"; then
  eval "$(direnv hook zsh)"
fi

# vim:set ft=zsh:
