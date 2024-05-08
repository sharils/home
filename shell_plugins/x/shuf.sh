#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

shuf() {
  {
    if [ -t 0 ]; then
      seq 0 9
    else
      cat
    fi
  } |
    tr -d ' ' |
    fold -w1 |
    sort -R |
    head -n"${1:-10}" |
    tr -d \\n |
    pbcopy &&
    pbpaste
}

shuf "$@"
