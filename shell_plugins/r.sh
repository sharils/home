#!/usr/bin/env sh

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
    case "$1" in
    '') $EDITOR "$(find src/ -name main.rs -o -name lib.rs)" ;;
    *) rustc --explain "$@" | l md ;;
    esac
    ;;
  *) reset ;;
  esac
}
