#!/usr/bin/env sh

literal() {
  cat <<SH
literal:
  %%: %
  %n: \n
  %t: \t
SH
}

literal "$@"
