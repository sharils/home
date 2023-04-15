#!/usr/bin/env sh

ex() {
  if [ $# -eq 0 ]; then
    iex
  else
    elixir -e "$*"
  fi
}

ex "$@"
