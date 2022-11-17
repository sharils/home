#!/usr/bin/env sh

l() {
  if [ -d "$1" ]; then
    ls -ahl "$@"
  else
    less "$@"
  fi
}
