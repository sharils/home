#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

r() {
  npm run "$@"
}

r "$@"
