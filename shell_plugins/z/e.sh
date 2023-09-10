#!/usr/bin/env sh

e() {
  case "$1" in
  e) set -- /elixir ;;
  p) set -- /python ;;
  r) set -- /rust ;;
  esac
  echo "$HOME/Exercism$*"
}

e "$@"
