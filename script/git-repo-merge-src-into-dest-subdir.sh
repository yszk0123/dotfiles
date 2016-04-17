#!/bin/bash
# cf. http://qiita.com/uasi/items/77d41698630fef012f82

DEST_REPO_PATH="$1"
SRC_REPO_URI="$2"
SRC_REPO="$3"
SUBDIR="$4"

pushd "$DEST_REPO_PATH"

git remote add "$SRC_REPO" "$SRC_REPO_URI"
git fetch "$SRC_REPO"

if [ -z "$SUBDIR" ]; then
  git merge -s subtree "$SRC_REPO/master"
elif [ -e "$SUBDIR" ]; then
  git merge -X subtree="$SUBDIR" "$SRC_REPO/master"
else
  git read-tree --prefix="$SUBDIR/" "$SRC_REPO/master"
  git checkout -- .
fi

popd
