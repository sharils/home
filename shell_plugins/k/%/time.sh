#!/usr/bin/env sh

percent_time() {
  cat <<SH
time:
  %R: %H:%M, $(date +%R)
  %T: %H:%M:%S, $(date +%T)
  %X: national, $(date +%X)
  %r: %I:%M:%S %p, $(date +%r)
  %EX: POSIX, $(date +%EX)
SH
  :
}

percent_time "$@"
