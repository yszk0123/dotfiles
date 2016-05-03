#!/bin/sh
# TODO: Symbolic linkなどが使われていると上手くいかない
pushd $(cd $(dirname $0) && pwd)

../linkDotfiles.sh
ansible-playbook -i hosts -vv localhost.yml

popd
