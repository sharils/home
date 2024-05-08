#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

b() {
  npm run build "$@"
}

b "$@"
