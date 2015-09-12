#!/bin/zsh
# cf. [yard graphでクラス図を生成しちゃえ☆（ゝω・）vｷｬﾋﾟ - すがブロ](http://sugamasao.hatenablog.com/entry/20120419/1334846227)

TARGET_DOT=${1:-output.dot}
TARGET_IMAGE=${1:-output.png}
# FLAGS=--full
FLAGS=

# Required for dot command
if [ type "$1" >/dev/null 2>&1 ]; then
  brew install Graphviz
fi

# yard doc

echo "Generating a dot file"
# --full = Add method names and property names etc
yard graph $FLAGS -f $TARGET_DOT

echo "Generating an image ..."
dot -Tpng $TARGET_DOT -o $TARGET_IMAGE
