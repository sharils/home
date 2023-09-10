#!/usr/bin/env sh

c() {
  case "$1" in
  *) git c "$@" ;;
  esac
}

c "$@"
