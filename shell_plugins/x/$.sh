#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

dollar() {
  "$@"
}

dollar "$@"
