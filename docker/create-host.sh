#!/bin/sh
THIS_DOCKER_HOST_NAME=conoha

docker-machine create \
  --driver openstack \
  --openstack-flavor-name g-1gb \
  --openstack-image-name vmi-ubuntu-16.04-amd64 \
  --openstack-sec-groups "default,gncs-ipv4-all" \
  $THIS_DOCKER_HOST_NAME

echo "Execute following command and add the environment variables to .envrc"
echo "\$ docker-machine env $THIS_DOCKER_HOST_NAME"
