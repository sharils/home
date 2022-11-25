#!/usr/bin/env sh

wb() {
  cmd="$1"
  shift
  case "$cmd" in
    -S) wb search "$@" ;;
    i) wb install "$@" ;;
    ls) wb list "$@" ;;
    *) whalebrew "$@" ;;
  esac
}
