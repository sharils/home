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

  s)
    cmd="${1:-status}"
    shift
    case "$cmd" in
      r) set -- restart "$@" ;;
      *) set -- "$cmd" "$@" ;;
    esac
    espanso service "$@"
    ;;

  esac
}
