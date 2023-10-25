#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

e() {
  case "$1" in
  e) echo "$HOME/Exercism/elixir" ;;
  p) echo "$HOME/Exercism/python" ;;
  r) echo "$HOME/Exercism/rust" ;;
  esac
}

e "$@"
