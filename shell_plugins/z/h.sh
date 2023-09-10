#!/usr/bin/env sh

h() {
  case "$1" in
  e) shift && set -- /Library/Preferences/espanso/match "$@" ;;
  esac
  echo "$SHARILS_HOME$*"
}

h "$@"
