#!/bin/sh
pushd $(dirname $0)
./linkDotfiles.sh
ansible-playbook -i hosts -vv localhost.yml
popd
