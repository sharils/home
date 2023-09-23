#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

py() {
  if [ $# -eq 0 ]; then
    python3
  else
    python3 -c "$*"
  fi
}

py "$@"
