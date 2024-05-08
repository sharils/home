#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

month() {
  cat <<SH
month:
  %B: national, $(date +%B)
  %b: national, $(date +%b)
  %h: %b, $(date +%h)
  %m: 01-12, $(date +%m)
  %Om: POSIX, $(date +%Om)
SH
}

month "$@"
