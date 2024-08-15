#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

ml() {
  echo 'E = 10^(4.8 + 1.5M)'
  bc --mathlib --expression="scale=2; e(l(10)*(4.8 + 1.5 * $1))"
}

ml "$@"
