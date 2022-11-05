#!/usr/bin/env sh

dk() {
  cmd="$1"
  shift

  case "$cmd" in
    *) docker "$cmd" "$@" ;;
  esac
}
