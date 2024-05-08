#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

_6_3() {
  for idx in $(seq 30); do
    printf "%2d%6.1f\n" "$idx" "$(bc --mathlib "--expression=$idx*6.3")"
  done | column
}

_6_3 "$@"
