#!/usr/bin/env sh

js() {
  watchman-make --pattern \
    '**/*.js' '**/*.jsx' '**/*.ts' '**/*.tsx' \
    '**/*.cjs' '**/*.cjsx' '**/*.cts' '**/*.ctsx' \
    '**/*.mjs' '**/*.mjsx' '**/*.mts' '**/*.mtsx' \
    --run "${*:-npm test}"
}

js "$@"
