#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

gh() {
  case "$1" in
  r) set -- /remotelytw ;;
  s) set -- /sharils ;;
  esac
  echo "$HOME/git/github.com$*"
}

gh "$@"
