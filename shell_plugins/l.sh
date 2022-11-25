#!/usr/bin/env sh

l() {
  if [ $# -eq 0 ] || [ -d "$1" ]; then
    ls -ahl "$@"
  else
    less "$@"
  fi
}
