#!/usr/bin/env sh

d() {
  if [ $# -eq 0 ]; then
    npm run dev
  else
    npm docs "$@"
  fi
}

d "$@"
