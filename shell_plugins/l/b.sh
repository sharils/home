#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

b() {
  case "$1" in
  l) bat --language=log --style=plain ~/Library/Logs/Livebook.log;;
  esac
}

b "$@"
