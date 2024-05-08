#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

datetime() {
  cat <<SH
datetime:
  %+: national, $(date +%+)
  %c: national, $(date +%c)
  %Ec: POSIX, $(date +%Ec)
SH
  :
}

datetime "$@"
