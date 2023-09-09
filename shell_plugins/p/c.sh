#!/usr/bin/env sh

c() {
  case "$1" in
  m)
    shift
    case "$1" in
    t) shift && set -- test "$@" ;;
    esac
    set -- run manage.py "$@"
    ;;
  r) shift && set -- report "$@" ;;
  esac
  "$SHARILS_HOME/shell_plugins/p/r.sh" c "$@"
}

c "$@"
