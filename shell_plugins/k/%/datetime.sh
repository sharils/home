#!/usr/bin/env sh

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
