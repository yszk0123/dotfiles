#!/bin/bash
# cf. http://qiita.com/uasi/items/77d41698630fef012f82

DEST_REPO_PATH="$1"
SRC_REPO_URI="$2"
SUBDIR="$3"

git clone "$SRC_REPO_URI" "$DEST_REPO_PATH"
pushd "$DEST_REPO_PATH"

git filter-branch --subdirectory-filter "$SUBDIR" HEAD

popd
