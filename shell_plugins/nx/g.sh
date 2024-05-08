#!/usr/bin/env sh
[ -n "$SET_X" ] && set -x

g() {
  if [ $# -eq 0 ]; then
    set -- graph "$@"
  else
    set -- generate "$@"
  fi
  npx --yes nx "$@"
}

g "$@"
