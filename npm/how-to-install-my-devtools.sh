#!/bin/bash
ghq get git@gitlab.com:yszk0123/devtools.git
pushd ~/src/gitlab.com/yszk0123/devtools
npm install
npm run build-cli
npm link .
popd
