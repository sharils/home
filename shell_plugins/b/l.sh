#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

l() {
  if [ $# -eq 0 ]; then
    bat --list-languages
  else
    BROWSER=lynx "$@"
  fi
}

l "$@"
