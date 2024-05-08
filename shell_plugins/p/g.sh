#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

g() {
  case "$1" in
  f)
    shift
    case "$1" in
    r) shift && PIP_USER=1 pip freeze >requirements.txt ;;
    esac
    set -- freeze "$@"
    ;;
  i) shift && set -- install "$@" ;;
  ls) shift && set -- list "$@" ;;
  s) shift && set -- search "$@" ;;
  rm) shift && set -- uninstall "$@" ;;
  v) shift && set -- show "$@" ;;
  esac
  PIP_USER=1 pip "$@"
}

g "$@"
