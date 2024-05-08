#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

day() {
  cat <<SH
day:
  %A: national, $(date +%A)
  %a: national, $(date +%a)
  %d: 01-31, $(date +%d)
  %e: 1-31, $(date +%e)
  %j: 001-366, $(date +%j)
  %u: 1-7, $(date +%u) # Mon-Sun
  %w: 0-6, $(date +%w) # Sun-Sat
  %Od: POSIX, $(date +%Od)
  %Oe: POSIX, $(date +%Oe)
  %Ou: POSIX, $(date +%Ou)
  %Ow: POSIX, $(date +%Ow)
SH
}

day "$@"
