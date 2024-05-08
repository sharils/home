#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

tsc() {
  npx --yes tsc --noEmit "$@"
}

tsc "$@"
