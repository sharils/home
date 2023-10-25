#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

h() {
  echo "$SHARILS_HOME$*"
}

h "$@"
