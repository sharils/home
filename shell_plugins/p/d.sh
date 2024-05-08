#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

d() {
  pmset displaysleepnow
}

d "$@"
