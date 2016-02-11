if is_exists 'pyenv'; then
  function load_python() {
    unset -f pyenv
    unset -f pip
    unset -f pip3
    unset -f nvim

    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
  }

  pyenv() { load_python; rbenv "$@"; }
  pip() { load_python; pip "$@"; }
  pip3() { load_python; pip3 "$@"; }
  nvim() { load_python; nvim "$@"; }
fi

# vim:set ft=zsh:
