#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

a() {
  case "$1" in
  cf) shift && "$SHARILS_HOME/shell_plugins/a/cf.sh" "$@" ;;
  ls) shift && "$SHARILS_HOME/shell_plugins/a/ls.sh" "$@" ;;
  s3) shift && "$SHARILS_HOME/shell_plugins/a/s3.sh" "$@" ;;
  g | l | s) "$SHARILS_HOME/shell_plugins/a/gls.sh" "$@" ;;
  esac
}
