#!/usr/bin/env sh

l() {
  if [ ! -t 0 ]; then
    b "${@:-man}" --style=plain
    return
  fi

  if [ $# -eq 1 ] && [ -f "$1" ]; then
    b --plain "$@"
    return
  fi

  lsd "$@"
}
