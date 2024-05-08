#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

minute() {
  cat <<SH
minute:
  %M: 00-59, $(date +%M)
  %OM: POSIX, $(date +%OM)
SH
}

minute "$@"
