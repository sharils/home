#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

c() {
  asdf current "$@"
}

c "$@"
