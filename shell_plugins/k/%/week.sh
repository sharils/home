#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

week() {
  cat <<SH
week:
  %U: 00-53, $(date +%U), Sun-Sat
  %V: 01-53, $(date +%V), ISO
  %W: 00-53, $(date +%W), Mon-Sun
  %OU: POSIX, $(date +%OU)
  %OV: POSIX, $(date +%OV)
  %OW: POSIX, $(date +%OW)
SH
}

week "$@"
