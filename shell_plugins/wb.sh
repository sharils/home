#!/usr/bin/env sh

wb() {
  case "$1" in
  i) shift && wb install "$@" ;;
  ls) shift && wb list "$@" ;;
  s) shift && wb search "$@" ;;
  *) whalebrew "$@" ;;
  esac
}
