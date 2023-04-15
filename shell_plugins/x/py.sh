#!/usr/bin/env sh

py() {
  if [ $# -eq 0 ]; then
    python3
  else
    python3 -c "$*"
  fi
}

py "$@"
