#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

oot() {
  case "$1" in
  l)
    shift
    case "$1" in
    l) shift && set -- --local --reverse --count 1 "${@:---public}" ;;
    p) shift && set -- --public --reverse --count 1 "$@" ;;
    t) shift && set -- --reverse --count 1 --tag "$@" ;;
    esac
    set -- timeline "$@"
    ;;
  n) shift && set -- notifications "${@:---reverse}" ;;
  p) shift && set -- post "${@:---editor}" ;;
  t) shift && set -- thread "$@" ;;
  ui) shift && set -- tui "$@" ;;
  esac

  [ -n "$TOOT_USING" ] && set -- "$@" --using "$TOOT_USING"

  toot "$@"
}

oot "$@"
