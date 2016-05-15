#!/bin/bash
# cf. http://qiita.com/uasi/items/77d41698630fef012f82

SUBDIR_A="$1"
SUBDIR_B="$2"
FIRST_COMMIT_OF_B="$3"
BRANCH="tmp-$SUBDIR_A-$SUBDIR_B"

git checkout -b "$BRANCH" "$FIRST_COMMIT_OF_B"

git rm -r --cached "$SUBDIR_A"
git read-tree --prefix="$SUBDIR_A/" "master:$SUBDIR_B"
git checkout -- .
git commit

git checkout master
git merge --squash "$BRANCH"

echo "Successfully merged. Temporary branch \"$BRANCH\" can be removed."
