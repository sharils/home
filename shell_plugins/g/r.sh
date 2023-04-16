#!/usr/bin/env sh

r() {
  if [ $# -eq 0 ]; then
    tig refs
  else
    git r "$@"
  fi
}

r "$@"
