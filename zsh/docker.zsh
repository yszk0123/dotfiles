if is_exists "docker-machine"; then
  function load_docker() {
    unset -f docker-machine
    unset -f docker

    eval "$(docker-machine env default)"
  }

  docker-machine() { load_docker; docker-machine "$@"; }
  docker() { load_docker; docker "$@"; }

  alias d='docker'
  alias di='docker images'
  alias dr='docker run'
  alias dt='docker tag'

  alias dm='docker-machine'
  alias dmls='docker-machine ls'
fi

# vim:set ft=zsh:
