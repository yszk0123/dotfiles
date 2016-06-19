#!/bin/bash
# Usage: ghq-mv.sh <target dir> <ghq root dir>
# cf. [ghq のディレクトリ構成に合わせて既存の git ディレクトリを mv するやつ - sonots:blog](http://blog.livedoor.jp/sonots/archives/38875802.html)

TARGET=$1
if [ -z "$2" ]; then
  GHQ_ROOT=$HOME/src
else
  GHQ_ROOT=$2
fi
[ ! -d "$TARGET/.git" ] && echo "$TARGET is not a valid git repository" && exit 1

cd "$TARGET"
url=$(git remote -v | grep origin | head -1 | awk '{print $2}')
basename=$(basename ${url%.*})
dirname=$(dirname $url | sed 's!git@\([^:]*\):!\1/!' | sed 's!https://!!' | sed 's!git://!!')
cd -
mkdir -p "$GHQ_ROOT/$dirname"
echo "mv $TARGET $GHQ_ROOT/$dirname/$basename"
mv "$TARGET" "$GHQ_ROOT/$dirname/$basename"
