#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

napkin() {
  case "$1" in
  cost) shift && "$SHARILS_HOME/shell_plugins/k/napkin/cost.sh" "$@" ;;
  op) shift && "$SHARILS_HOME/shell_plugins/k/napkin/op.sh" "$@" ;;
  esac
}

napkin "$@"
