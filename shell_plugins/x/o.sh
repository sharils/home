#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

o() {
  case "$1" in
  *) open "${@:-.}" ;;
  esac
}

o "$@"
