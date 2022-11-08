#!/usr/bin/env sh

e() {
  cmd="${1:-edit}"
  shift

  case "$cmd" in

  r) cmd=restart ;;
  s) cmd=status ;;

  esac

  espanso "$cmd" "$@"
}
