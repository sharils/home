#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

n() {
  case "$1" in
  m) cmd="$2" && shift 2 && set -- "$cmd" --module "$@" ;;
  u) cmd="$2_umbrella" && shift 2 && set -- "$cmd" --umbrella "$@" ;;
  esac
  mix new "$@" && cd "$cmd" && return $?
}

n "$@"
