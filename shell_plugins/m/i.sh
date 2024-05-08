#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

i() {
  if [ $# -eq 0 ]; then
    iex -S mix "$@"
    return
  fi
  mix install "$@"
}

i "$@"
