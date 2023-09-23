#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

r() {
  case "$1" in
  '') shift && MIX_ENV=prod mix release ;;
  i) shift && MIX_ENV=prod mix release.init "$@" ;;
  nh) shift && mix run --no-halt "$@" ;;
  ns) shift && iex -S mix run --no-start "$@" ;;
  *) mix run "$@" ;;
  esac
}

r "$@"
