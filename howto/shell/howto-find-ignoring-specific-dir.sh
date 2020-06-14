#!/bin/sh
# cf. http://stackoverflow.com/questions/4210042/exclude-directory-from-find-command
#     (http://stackoverflow.com/a/16595367)

# e.g. find . -not \( -path '*node_modules*' -prune \) -name 'package.json'
find . -not \( -path <ignore-path> -prune \) -name <name>
