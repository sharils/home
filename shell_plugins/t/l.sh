#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

l() {
  case "$1" in
  l) shift && set -- --local --reverse --count 1 "${@:---public}" ;;
  p) shift && set -- --public --reverse --count 1 "$@" ;;
  t) shift && set -- --reverse --count 1 --tag "$@" ;;
  esac
  "$SHARILS_HOME/shell_plugins/t/oot.sh" timeline "$@"
}

l "$@"
