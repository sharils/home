#!/usr/bin/env sh

dco() {
  cmd="$1"
  shift

  case "$cmd" in
    b) dco build "$@" ;;
    d) dco down "$@" ;;
    e) dco exec "$@" ;;
    u) dco up "$@" ;;
    *) docker compose "$cmd" "$@" ;;
  esac
}
