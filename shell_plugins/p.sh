#!/usr/bin/env sh

p() {
  cmd="$1"
  shift
  case "$cmd" in
  a) poetry add "$@" ;;
  i) poetry install "$@" ;;
  m) python -m "$@" ;;
  r) poetry run "$@" ;;
  *) echo not implemented >&2 ;;
  esac
}
