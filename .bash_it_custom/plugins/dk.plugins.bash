#!/usr/bin/env sh

dk() {
  cmd="$1"
  shift

  case "$cmd" in
    o) open -b com.docker.docker ;;
    *) docker "$cmd" "$@" ;;
  esac
}
