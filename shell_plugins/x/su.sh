#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

_su() {
  if [ $# -eq 0 ]; then
    sudo su - "${X_SU:?}" "$@"
    return $?
  fi

  case "$1" in
  b)
    shift
    case "$1" in
    i) shift && set -- install "$@" ;;
    esac
    set -- brew "$@"
    ;;
  esac
  sudo su "${X_SU:?}" -c "$*"
}

_su "$@"
