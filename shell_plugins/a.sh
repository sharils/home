#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

a() {
  case "$1" in
  c) shift && "$SHARILS_HOME/shell_plugins/a/c.sh" "$@" ;;
  cf) shift && "$SHARILS_HOME/shell_plugins/a/cf.sh" "$@" ;;
  d) shift && "$SHARILS_HOME/shell_plugins/a/d.sh" "$@" ;;
  i) shift && "$SHARILS_HOME/shell_plugins/a/i.sh" "$@" ;;
  ls) shift && "$SHARILS_HOME/shell_plugins/a/ls.sh" "$@" ;;
  p) shift && "$SHARILS_HOME/shell_plugins/a/p.sh" "$@" ;;
  s3) shift && "$SHARILS_HOME/shell_plugins/a/s3.sh" "$@" ;;
  g | l | s) "$SHARILS_HOME/shell_plugins/a/gls.sh" "$@" ;;
  esac
}
