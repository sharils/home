#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

a() {
  case "$1" in
  D) shift && set -- --group dev "$@" ;;
  esac
  poetry add "$@"
}

a "$@"
