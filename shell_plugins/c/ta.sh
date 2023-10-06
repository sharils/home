#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

ta() {
  curl --proto-default 'https' --trace-ascii - "$@"
}

ta "$@"
