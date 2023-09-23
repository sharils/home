#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

e() {
  case "$1" in
  e) set -- /elixir ;;
  p) set -- /python ;;
  r) set -- /rust ;;
  esac
  echo "$HOME/Exercism$*"
}

e "$@"
