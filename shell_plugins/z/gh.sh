#!/usr/bin/env sh

gh() {
  case "$1" in
  r) set -- /remotelytw ;;
  s) set -- /sharils ;;
  esac
  cd "$HOME/git/github.com$*" || return
}

gh "$@"
