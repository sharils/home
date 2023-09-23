#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

w() {
  npm run web "$@"
}

w "$@"
