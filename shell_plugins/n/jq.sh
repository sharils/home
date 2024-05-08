#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

n_jq() {
  jq <package.json "$@"
}

n_jq "$@"
