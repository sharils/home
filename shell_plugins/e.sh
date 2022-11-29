#!/usr/bin/env sh

e() {
  cmd="${1:-edit}"
  shift

  case "$cmd" in

  e)
    cmd="${1:-base}"
    shift
    case "$cmd" in
      e) cmd=emoji ;;
    esac
    espanso edit "$cmd" "$@"
    ;;
  r) espanso restart "$@" ;;
  s) espanso status "$@" ;;

  esac
}
