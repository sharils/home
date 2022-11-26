#!/usr/bin/env sh

e() {
  cmd="${1:-edit}"
  shift

  case "$cmd" in

  e) espanso edit "$@" ;;
  r) espanso restart "$@" ;;
  s) espanso status "$@" ;;

  esac
}
