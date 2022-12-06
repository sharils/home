#!/usr/bin/env sh

b() {
  cmd="${1:-help}"
  shift

  case "$cmd" in
  h) brew help "$@" ;;
  i) brew install "$@" ;;
  ri) brew reinstall "$@" ;;
  out) brew outdated "$@" ;;
  *) brew "$cmd" "$@"
  esac

}
