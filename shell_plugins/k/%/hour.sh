#!/usr/bin/env sh

hour() {
  cat <<SH
hour:
  %H: 00-23, $(date +%H)
  %I: 00-12, $(date +%I)
  %k: 0-23, $(date +%k)
  %l: 1-12, $(date +%l)
  %p: national, $(date +%p)
  %OH: POSIX, $(date +%OH)
  %OI: POSIX, $(date +%OI)
SH
}

hour "$@"
