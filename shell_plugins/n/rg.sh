#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

n_rg() {
  rg "$@" package.json
}

n_rg "$@"
