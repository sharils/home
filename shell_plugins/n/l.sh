#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

l() {
  [ $# -eq 0 ] && set -- --fix . "$@"
  npx --yes eslint "$@"
}

l "$@"
