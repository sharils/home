#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

r() {
  if [ -f "$1" ] && [ "${1##*.}" = "rs" ]; then
    rustc "$@"
    return $?
  fi
  case "$1" in
  d)
    shift
    case "$1" in
    b) shift && set -- --book "$@" ;;
    esac
    rustup docs "$@"
    ;;
  e)
    shift
    if [ $# -eq 0 ]; then
      $EDITOR "$(find src/ -name main.rs -o -name lib.rs)"
      return
    fi
    case "$1" in
    l) $EDITOR src/lib.rs ;;
    m) $EDITOR src/main.rs ;;
    *) rustc --explain "$@" | l md ;;
    esac
    ;;
  *) reset ;;
  esac
}
