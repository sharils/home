#!/usr/bin/env sh

extension() {
  cat <<SH
extension:
  %-*: GNU, no padding
  %_*: GNU, space padding
  %0*: GNU, zero padding
SH
}

extension "$@"
