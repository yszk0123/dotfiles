#!/bin/bash
# cf. http://qiita.com/uasi/items/77d41698630fef012f82

DEST_REPO_PATH="$1"
SRC_REPO="$2"
SRC_REPO_URI="$3"

pushd "$DEST_REPO_PATH"
git remote add "$SRC_REPO" "$SRC_REPO_URI"
git fetch "$SRC_REPO"
git merge "$SRC_REPO/master"
popd
