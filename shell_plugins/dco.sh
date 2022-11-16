#!/usr/bin/env sh

dco() {
  cmd="$1"
  shift

  case "$cmd" in
    *) docker compose "$cmd" "$@" ;;
  esac
}
