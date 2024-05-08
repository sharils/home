#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

p() {
  if [ $# -eq 0 ]; then
    set -- ls "$@"
  fi

  case "$1" in

  a)
    shift
    case "$1" in
    js) shift && set -- nodejs "$@" ;;
    *) echo not implemented >&2 ;;
    esac
    asdf plugin add "$@"
    ;;

  ls) shift && asdf plugin list "$@" ;;

  rm)
    shift
    case "$1" in
    js) shift && set -- nodejs "$@" ;;
    *) echo not implemented >&2 ;;
    esac
    asdf plugin remove "$@"
    ;;

  *) asdf plugin "$@" ;;

  esac
}

p "$@"
