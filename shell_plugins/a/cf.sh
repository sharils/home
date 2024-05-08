#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

cf() {
  aws cloudfront "$@"
}

cf "$@"
