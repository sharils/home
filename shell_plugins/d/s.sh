#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

s() {
  case "$1" in
  p) shift && set -- prune "$@" ;;
  esac
  docker system "$@"
}

s "$@"
