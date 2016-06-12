#!/bin/sh
# Note: see create-new-project.sh more detail
USER_NAME="$1"
PROJECT_NAME="$2"
PROJECT_DIR="$HOME/src/gitlab.com/$USER_NAME/$PROJECT_NAME"
[ -z "$USER_NAME" ] && echo USER_NAME required && exit 1
[ -z "$PROJECT_NAME" ] && echo PROJECT_NAME required && exit 1

mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"
git init
git remote add origin "git@gitlab.com:$USER_NAME/$PROJECT_NAME.git"
sh ~/dotfiles/gitlab/create-new-project.sh "$PROJECT_NAME"
