#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

s() {
  case "$1" in
  R) shift && set -- register "$@" ;;
  r) shift && set -- restart "$@" ;;
  s) shift && set -- start "$@" ;;
  esac
  espanso service "${@:-status}"
}

s "$@"
