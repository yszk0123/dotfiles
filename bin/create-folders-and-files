#!/bin/sh
# Create files and folders as need
# Example:
#   $ cat <<EOS | create-files-and-folder.sh
#   foo/bar/baz.txt
#   foo/bar/baz.md template.md
#   bar/baz.txt path/to/template.txt
#   EOS

while read line; do
  args=($line)
  file_path=${args[0]}
  default_content_path=${args[1]}
  folder_path=$(dirname $file_path)

  if [ ! -e "$folder_path" ]; then
    echo "creating folder: $folder_path"
    mkdir -p "$folder_path"
  end

  if [ ! -e "$file_path" ]; then
    echo "creating file: $file_path"
    if [ -z "$default_content_path" ]; then
      touch "$file_path"
    else
      cp "$default_content_path" "$file_path"
    fi
  fi
done < "${1:-/dev/stdin}"
