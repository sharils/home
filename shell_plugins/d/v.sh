#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

v() {
  case "$1" in
  c) shift && docker volume create "$@" ;;
  i) shift && docker volume inspect "$@" ;;
  p) shift && docker volume prune "$@" ;;
  ls | rm) docker volume "$@" ;;
  esac
}

v "$@"
