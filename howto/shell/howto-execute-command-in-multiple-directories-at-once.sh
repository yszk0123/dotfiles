#!/bin/sh

# copy .eslintrc
ls | grep hello- | xargs -I{} sh -c 'cp .eslintrc {}/'

# execute "git init"
ls | grep hello- | xargs -I{} bash -c 'pushd {} && git init && popd'
