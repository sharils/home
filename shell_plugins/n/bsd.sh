#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

bsd() {
  npx --yes license BSD-3-Clause "$@"
}

bsd "$@"
