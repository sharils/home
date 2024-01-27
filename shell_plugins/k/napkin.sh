#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

napkin() {
  case "$1" in
  op) shift && "$SHARILS_HOME/shell_plugins/k/napkin/op.sh" "$@" ;;
  esac
}

napkin "$@"
