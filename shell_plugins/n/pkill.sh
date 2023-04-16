#!/usr/bin/env sh

pkill() {
  if [ $# -eq 0 ]; then
    rm -fr ./node_modules
  else
    npx --yes npkill "$@"
  fi
}

pkill "$@"
