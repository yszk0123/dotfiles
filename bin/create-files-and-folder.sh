#!/bin/sh
# Create files and folders as need
# Example:
#   $ cat <<EOS | create-files-and-folder.sh
#   foo/bar/baz.txt
#   foo/bar/baz.md
#   bar/baz.txt
#   EOS

while read file_path; do
  [ -z "$file_path" ] && continue

  folder_path=$(dirname $file_path)

  echo "creating file: $folder_path"
  mkdir -p "$folder_path"

  echo "creating folder: $file_path"
  [ ! -e "$file_path" ] && touch "$file_path"
done < "${1:-/dev/stdin}"
