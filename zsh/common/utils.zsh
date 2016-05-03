function is_exists() {
  type "$1" >/dev/null 2>&1
  return $?
}

# vim:set ft=zsh:
