#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

h_mix() {
  if [ $# -eq 0 ]; then
    mix --help | l
  else
    mix help "$@" | l md
  fi
}

h_mix "$@"
