#!/bin/bash
[[ ! -d ".git" ]] && echo 'Not a git repository' && exit 1
[[ -n "$(git remote)" ]] && echo 'remote origin is already set. removing ...' && git remote remove origin
set -eu

dir="$(basename $(pwd))"
git remote add origin git@gitlab.com:$(whoami)/$dir.git
git push -u origin master
