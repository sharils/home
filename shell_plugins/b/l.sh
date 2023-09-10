#!/usr/bin/env sh

l() {
  if [ $# -eq 0 ]; then
    bat --list-languages
  else
    BROWSER=lynx "$@"
  fi
}

l "$@"
