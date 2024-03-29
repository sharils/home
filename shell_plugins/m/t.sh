#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

t() {
  case "$1" in
  f) shift && set -- --failed "$@" ;;
  mf) shift && set -- --max-failures "${@:-1}" ;;
  s) shift && set -- --seed 0 "$@" ;;
  t) shift && set -- --trace "$@" ;;
  esac
  mix test "$@"
}

t "$@"
