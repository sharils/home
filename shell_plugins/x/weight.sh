#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

weight() {
  printf '%4.1f\n%4.1f\n%4.1f\n%4.1f' \
    "$(echo "${X_WEIGHT:?} + $1 / 10" | bc -l)" \
    "$(echo "($2 - $1) / 10" | bc -l)" \
    "$(echo "($3 - $1) / 10" | bc -l)" \
    "$(echo "($4 - $1) / 10" | bc -l)"
}

weight "$@"
