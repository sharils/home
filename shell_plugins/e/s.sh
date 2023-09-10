#!/usr/bin/env sh

s() {
  case "$1" in
  R) shift && set -- register "$@" ;;
  r) shift && set -- restart "$@" ;;
  s) shift && set -- start "$@" ;;
  esac
  espanso service "${@:-status}"
}

s "$@"
