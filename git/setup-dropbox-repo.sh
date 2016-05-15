#!/bin/sh
[[ ! -d ".git" ]] && echo 'Not a git repository' && exit 1
[[ -n "$(git remote)" ]] && echo 'Already have remote repositories' && exit 1
set -eu

dir="$(basename $(pwd))"
pushd ~/Dropbox/git && mkdir $dir.git && cd $dir.git && git init --bare && popd
git remote add origin ~/Dropbox/git/$dir.git
