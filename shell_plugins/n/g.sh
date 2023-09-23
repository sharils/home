#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

g() {
  NPM_CONFIG_GLOBAL='1' npm "$@"
}

g "$@"
