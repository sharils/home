#!/usr/bin/env sh

s() {
  case "$1" in
  p) shift && set -- prune "$@" ;;
  esac
  docker system "$@"
}

s "$@"
