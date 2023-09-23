#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

v_v() {
  case "$1" in
  erl) "$1" -version ;;
  *) "$@" --version ;;
  esac
}

v_v "$@"
