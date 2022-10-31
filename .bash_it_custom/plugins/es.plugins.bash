#!/usr/bin/env sh

es() {
  cmd="${1:-edit}"
  shift

  case "$cmd" in

  r) cmd=restart ;;
  s) cmd=status ;;

  esac

  espanso "$cmd" "$@"
}
