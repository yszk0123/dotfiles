#!/bin/bash
# cf. http://qiita.com/k0kubun/items/5cb8209e3d1854ac2e2e

function replace-githooks() {
  if [ -e .git/hooks ]; then
    rm -rf .git/hooks
    ln -s ~/.git_template/hooks .git/hooks
  fi
}

for repo in `ghq list`; do
  pushd "${GOPATH}/src/${repo}" > /dev/null
  replace-githooks
  echo "replaced ${repo}"
  popd > /dev/null
done
