#!/usr/bin/env sh

e() {
  cmd="${1:-edit}"
  shift

  case "$cmd" in

  e) cmd=edit ;;
  r) cmd=restart ;;
  s) cmd=status ;;

  esac

  espanso "$cmd" "$@"
}
