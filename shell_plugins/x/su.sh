#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

_su() {
  [ $# -ge 1 ] && set -- -c "$*"
  sudo su - "${X_SU:?}" "$@"
}

_su "$@"
