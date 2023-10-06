#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

v() {
  curl --verbose --proto-default 'https' "$@"
}

v "$@"
