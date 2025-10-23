#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

lab() {
  c="$(printf 'scale=2; sqrt(%s^2 + %s^2)' "$2" "$3" | bc -l)"
  printf 'lab(%s, %s, %s) = lch(%s, %s, h)' "$1" "$2" "$3" "$1" "$c"
}

lab "$@"
