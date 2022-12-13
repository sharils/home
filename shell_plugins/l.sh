#!/usr/bin/env sh

l() {
  if [ ! -t 0 ]; then
    b "${@:-txt}" --style=plain
    return
  fi

  for arg in "$@"; do
    if [ -f "$arg" ]; then
      b -p "$@"
      return
    fi
  done

  ls "${@:--ahl}"
}
