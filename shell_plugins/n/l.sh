#!/usr/bin/env sh

l() {
  [ $# -eq 0 ] && set -- --fix . "$@"
  npx --yes eslint "$@"
}

l "$@"
