#!/usr/bin/env sh

r() {
  case "$1" in
  c) shift && set -- coverage "$@" ;;
  p) shift && set -- python "$@" ;;
  esac
  poetry run "$@"
}

r "$@"
