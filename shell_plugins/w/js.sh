#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

js() {
  watchman-make --pattern \
    '**/*.js' '**/*.jsx' '**/*.ts' '**/*.tsx' \
    '**/*.cjs' '**/*.cjsx' '**/*.cts' '**/*.ctsx' \
    '**/*.mjs' '**/*.mjsx' '**/*.mts' '**/*.mtsx' \
    --run "${*:-npm test}"
}

js "$@"
