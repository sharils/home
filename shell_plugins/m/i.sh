#!/usr/bin/env sh

i() {
  if [ $# -eq 0 ]; then
    iex -S mix "$@"
    return
  fi
  mix install "$@"
}

i "$@"
