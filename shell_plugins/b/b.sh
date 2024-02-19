#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

b() {
  case "$1" in
  d) shift && set -- dump --file - "$@" ;;
  esac
  brew bundle "$@"
}

b "$@"
