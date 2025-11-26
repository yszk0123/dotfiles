# direnv
if is_exists "direnv"; then
  eval "$(direnv hook zsh)"
fi

# others
function source_if_exists() {
  if [ -e "$1" ]; then
    source "$1"
  fi
}

# vim:set ft=zsh:
