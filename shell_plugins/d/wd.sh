#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

wd() {
  date -jf%F "$1" +'%F %A' | pbcopy && pbpaste
}

wd "$@"
