#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

extension() {
  cat <<SH
extension:
  %-*: GNU, no padding
  %_*: GNU, space padding
  %0*: GNU, zero padding
SH
}

extension "$@"
