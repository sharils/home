#!/usr/bin/env sh

r() {
  case "$1" in
  e) shift && rustc --explain "$@" | l md ;;
  *) reset ;;
  esac
}
