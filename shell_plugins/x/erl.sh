#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x_erl() {
  if [ $# -eq 0 ]; then
    erl
  else
    erl -noshell -eval "$*" -eval "init:stop()"
  fi
}

x_erl "$@"
