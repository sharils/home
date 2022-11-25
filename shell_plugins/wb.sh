#!/usr/bin/env sh

wb() {
  cmd="$1"
  shift
  case "$cmd" in
    -S) wb search "$@" ;;
    *) whalebrew "$@" ;;
  esac
}
