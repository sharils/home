#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

batt() {
  pmset -g batt "$@"
}

batt "$@"
