if is_exists "boot2docker"; then
  function load_docker() {
    unset -f boot2docker
    unset -f boot2docker-vm
    unset -f docker

    export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375
    export DOCKER_CERT_PATH="$HOME/.boot2docker/certs/boot2docker-vm"
    export DOCKER_TLS_VERIFY=1
  }

  boot2docker-vm() { load_docker; boot2docker-vm "$@"; }
  boot2docker() { load_docker; boot2docker "$@"; }
  docker() { load_docker; docker "$@"; }
fi

# vim:set ft=zsh:
