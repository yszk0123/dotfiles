#!/bin/sh
# require: https://www.npmjs.com/package/diff2html-cli
BRANCH=$(git rev-parse --abbrev-ref HEAD)
git diff origin/$BRANCH | diff2html -i stdin
