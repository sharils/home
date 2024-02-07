#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

f() {
  BROWSER=/Applications/Firefox.app/Contents/MacOS/firefox
  case "$1" in
  *) BROWSER=$BROWSER "$@" ;;
  esac
}

f "$@"
