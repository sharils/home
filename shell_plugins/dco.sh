#!/usr/bin/env sh

dco() {
  cmd="$1"
  shift

  case "$cmd" in
  b) dco build "$@" ;;
  d) dco down "$@" ;;
  e) dco exec "$@" ;;
  l) dco logs "$@" ;;
  r) dco run "$@" ;;
  u)
    cmd="$1"
    shift
    case "$cmd" in
      b) set -- --build "$@" ;;
      *) set -- "$cmd" "$@" ;;
    esac
    dco up "$@"
    ;;
  *) docker compose "$cmd" "$@" ;;
  esac
}
