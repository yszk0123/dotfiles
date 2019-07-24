#!/bin/bash -e
COMMIT_HASH="$1"

[ -z "$1" ] && echo no args && exit 1

git diff --name-only "$COMMIT_HASH" | ag '\.(tsx?|jsx?)' | xargs yarn prettier --no-config --print-width=100 --tab-width=2 --use-tabs=false --single-quote=true --trailing-comma=all --arrow-parens=always
