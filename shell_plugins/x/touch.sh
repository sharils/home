#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

touch() {
  mkdir -pv "$(dirname "$*")"
  /usr/bin/env touch "$*"
  if [ ! -t 0 ]; then
    cat >"$*"
  fi
}

touch "$@"
