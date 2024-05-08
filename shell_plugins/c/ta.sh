#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

ta() {
  curl --trace-ascii - "$@"
}

ta "$@"
