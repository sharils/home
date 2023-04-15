#!/usr/bin/env sh

erl() {
  if [ $# -eq 0 ]; then
    erl
  else
    erl -noshell -eval "$*,init:stop()."
  fi
}

erl "$@"
