#!/bin/sh
# require: gitlab.com/yszk0123/devtools
# require: brew install browser
BRANCH=$(git rev-parse --abbrev-ref HEAD)
render-diff origin/$BRANCH | browser
