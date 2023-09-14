#!/usr/bin/env sh

c() {
  case "$1" in
  m)
    shift
    case "$1" in
    t) shift && set -- test "$@" ;;
    esac
    "$SHARILS_HOME/shell_plugins/p/r.sh" c run manage.py "$@"
    ;;
  r) shift && "$SHARILS_HOME/shell_plugins/p/r.sh" c report "$@" ;;
  esac
}

c "$@"
