#!/usr/bin/env sh

data() {
  cmd="${1:-image/gif}"
  shift
  printf "data:%s;base64,%s" "$cmd" "$(base64 "$@")"
}

data "$@"
