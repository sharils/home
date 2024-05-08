#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

pkill() {
  if [ $# -eq 0 ]; then
    rm -fr ./node_modules
  else
    npx --yes npkill "$@"
  fi
}

pkill "$@"
