#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

bs() {
  npx --yes browser-sync "${@:-.}" --no-open
}

bs "$@"
