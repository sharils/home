#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

fong() {
  bc --mathlib <<BC
n = $1; a = $2; b = $3;
abs(a - b) - 1.65 * sqrt( ( (a + b) * (2 * n - a - b) ) / (2 * n) );
BC
}

fong "$@"
