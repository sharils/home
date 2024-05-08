#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

uri() {
  jq --raw-input --raw-output @uri "$@"
}

uri "$@"
