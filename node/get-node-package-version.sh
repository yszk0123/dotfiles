#!/bin/sh
PACKAGE_DIR="$1"

code="console.log(JSON.parse(require('fs').readFileSync(require.resolve('$PACKAGE_DIR/package.json'))).version)"
node -e "$code"
