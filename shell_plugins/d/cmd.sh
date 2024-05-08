#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

cmd() {
  echo "$@" | jq --compact-output --raw-input 'split(" ")'
}

cmd "$@"
