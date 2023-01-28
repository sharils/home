#!/usr/bin/env sh

wb() {
  case "$1" in
    -S) shift && wb search "$@" ;;
    i) shift && wb install "$@" ;;
    ls) shift && wb list "$@" ;;
    *) whalebrew "$@" ;;
  esac
}
