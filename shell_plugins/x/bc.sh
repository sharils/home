#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x_bc() {
  if [ $# -eq 0 ]; then
    bc --mathlib
  else
    bc --mathlib --expression="$*"
  fi
}

x_bc "$@"
