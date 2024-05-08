#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

d() {
  if [ $# -eq 0 ]; then
    mix deps
    return
  fi
  case "$1" in
  g) shift && mix deps.get "$@" ;;
  u) shift && mix deps.update "$@" ;;
  *) cmd="$1" && shift && mix deps."$cmd" "$@" ;;
  esac
}

d "$@"
