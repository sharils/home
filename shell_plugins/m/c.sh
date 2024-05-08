#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

c() {
  case "$1" in
  p) MIX_ENV=prod mix compile "$@" ;;
  *) mix compile "$@" ;;
  esac
}

c "$@"
