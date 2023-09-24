#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

g() {
  case "$1" in
  f) shift && set -- freeze --user "$@";;
  i) shift && set -- install --user "$@";;
  l) shift && set -- list --user "$@";;
  s) shift && set -- search "$@";;
  rm) shift && set -- uninstall "$@";;
  v) shift && set -- show "$@";;
  esac
  pip "$@"
}

g "$@"
