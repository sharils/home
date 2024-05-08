#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

ex() {
  if [ $# -eq 0 ]; then
    iex
  else
    elixir -e "$*"
  fi
}

ex "$@"
