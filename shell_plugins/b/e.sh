#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

e() {
  case "$1" in
  '') $EDITOR "$@" ~/.bash_profile ;;
  *) brew edit "$@" ;;
  esac
}

e "$@"
