#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

h() {
  case "$1" in
  e) shift && set -- /Library/Preferences/espanso/match "$@" ;;
  esac
  echo "$SHARILS_HOME$*"
}

h "$@"
