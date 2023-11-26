#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

fong() {
  bc --mathlib <<BC
a = $1; b = $2; n = $3;
abs(a - b) - 1.65 * sqrt( ( (a + b) * (2 * n - a - b) ) / (2 * n) );
BC
}

fong "$@"
