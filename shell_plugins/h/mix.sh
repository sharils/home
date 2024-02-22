#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

h_mix() {
  if [ $# -eq 0 ]; then
    mix --help
  else
    mix help "$@" | bat --language md --style=plain
  fi
}

h_mix "$@"
