#!/usr/bin/env sh

l() {
  if [ ! -t 0 ]; then
    less
    return
  fi

  for arg in "$@"; do
    if [ -f "$arg" ]; then
      less "$@"
      return
    fi
  done

  ls "${@:--ahl}"
}
