#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

r() {
  case "$1" in
  c) shift && set -- coverage "$@" ;;
  p) shift && set -- python "$@" ;;
  esac
  poetry run "$@"
}

r "$@"
