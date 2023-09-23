#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

timezone() {
  cat <<SH
timezone:
  %Z: $(date +%Z)
  %z: $(date +%z)
SH
}

timezone "$@"
