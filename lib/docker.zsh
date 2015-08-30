if is_exists "docker-machine"; then
  function load_docker() {
    unset -f docker-machine
    unset -f docker

    eval "$(docker-machine env default)"
  }

  docker-machine() { load_docker; docker-machine "$@"; }
  docker() { load_docker; docker "$@"; }
fi

# vim:set ft=zsh:
