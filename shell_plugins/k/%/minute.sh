#!/usr/bin/env sh

minute() {
  cat <<SH
minute:
  %M: 00-59, $(date +%M)
  %OM: POSIX, $(date +%OM)
SH
}

minute "$@"
