#!/bin/sh
# cf. http://unix.stackexchange.com/questions/24134/remove-empty-directory-trees-removing-as-many-directories-as-possible-but-no-fi

USAGE="usage: <this/command> root_dir"
ROOT_DIR="$1"
[ -z "$ROOT_DIR" ] && echo "$USAGE" && exit 1
find "$ROOT_DIR" -type d -empty -delete
