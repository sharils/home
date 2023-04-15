#!/usr/bin/env sh

bc() {
  if [ $# -eq 0 ]; then
    /usr/bin/env bc --mathlib
  elif [ "$1" = 'ft' ]; then
    # Fong’s test https://www.kano.plus/about-kano#discrete-analysis
    shift && bc --mathlib <<BC
a = $1; b = $2; n = $3;
abs(a - b) - 1.65 * sqrt( ( (a + b) * (2 * n - a - b) ) / (2 * n) );
BC
  else
    bc --mathlib --expression="$*"
  fi
}

bc "$@"
