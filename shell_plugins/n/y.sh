#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

y() {
  npx --yes "$@"
}

y "$@"
