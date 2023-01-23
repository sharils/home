#!/usr/bin/env sh

p() {
  cmd="$1"
  shift
  case "$cmd" in
  m) python -m "$@" ;;
  *) echo not implemented >&2 ;;
  esac
}
