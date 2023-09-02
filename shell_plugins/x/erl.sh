#!/usr/bin/env sh

x_erl() {
  if [ $# -eq 0 ]; then
    erl
  else
    erl -noshell -eval "$*" -eval "init:stop()"
  fi
}

x_erl "$@"
