#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

bmi() {
  bc --mathlib --expression="scale=2; $2 / ($1 / 100)^2"
}

bmi "$@"
