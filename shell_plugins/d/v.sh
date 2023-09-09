#!/usr/bin/env sh

v() {
  case "$1" in
  c) shift && docker volume create "$@" ;;
  i) shift && docker volume inspect "$@" ;;
  p) shift && docker volume prune "$@" ;;
  ls | rm) docker volume "$@" ;;
  esac
}

v "$@"
