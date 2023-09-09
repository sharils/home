#!/usr/bin/env sh

l() {
  [ $# -eq 0 ] && set -- --fix . "$@"
  n eslint "$@"
}

l "$@"
