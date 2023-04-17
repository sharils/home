#!/usr/bin/env sh

r() {
  case "$1" in
  d) shift && rustup docs "$@" ;;
  e) shift && rustc --explain "$@" | l md ;;
  *) reset ;;
  esac
}
