#!/usr/bin/env sh

c() {
  case "$1" in
  p) MIX_ENV=prod mix compile "$@" ;;
  *) mix compile "$@" ;;
  esac
}

c "$@"
