#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

a() {
  npm run android
}

a "$@"
