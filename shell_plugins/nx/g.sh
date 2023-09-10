#!/usr/bin/env sh

g() {
  if [ $# -eq 0 ]; then
    set -- graph "$@"
  else
    set -- generate "$@"
  fi
  npx --yes nx "$@"
}

g "$@"
