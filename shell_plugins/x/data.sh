#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

data() {
  cmd="${1:-image/gif}"
  shift
  printf "data:%s;base64,%s" "$cmd" "$(base64 "$@")"
}

data "$@"
