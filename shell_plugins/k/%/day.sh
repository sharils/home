#!/usr/bin/env sh

day() {
  cat <<SH
day:
  %A: national, $(date +%A)
  %a: national, $(date +%a)
  %d: 01-31, $(date +%d)
  %e: 1-31, $(date +%e)
  %j: 001-366, $(date +%j)
  %u: 1-7, Mon-Sun, $(date +%u)
  %w: 0-6, Sun-Sat, $(date +%w)
  %Od: POSIX, $(date +%Od)
  %Oe: POSIX, $(date +%Oe)
  %Ou: POSIX, $(date +%Ou)
  %Ow: POSIX, $(date +%Ow)
SH
}

day "$@"
