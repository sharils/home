#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

a4() {
  echo '210 × 297 mm # 210 * sqrt(2) by ISO 216'
}

a4 "$@"
