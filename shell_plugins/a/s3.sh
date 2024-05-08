#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

s3() {
  aws s3 "$@"
}

s3 "$@"
