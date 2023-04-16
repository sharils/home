#!/usr/bin/env sh

second() {
  cat <<SH
second:
  %S: 00-60, $(date +%S)
  %s: 0-67768036191676799, $(date +%s)
  %OS: POSIX, $(date +%OS)
SH
}

second "$@"
