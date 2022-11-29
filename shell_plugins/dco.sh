#!/usr/bin/env sh

dco() {
  cmd="$1"
  shift

  case "$cmd" in
    b) dco build "$@" ;;
    *) docker compose "$cmd" "$@" ;;
  esac
}
