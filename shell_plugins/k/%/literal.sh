#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

literal() {
  cat <<SH
literal:
  %%: %
  %n: \n
  %t: \t
SH
}

literal "$@"
