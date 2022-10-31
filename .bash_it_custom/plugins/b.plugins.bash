#!/usr/bin/env sh

b() {
  cmd="${1:-help}"
  shift

  case "$cmd" in
  i) cmd=install ;;
  esac

  brew "$cmd" "$@"
}
