#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

c() {
  case "$1" in
  [1-9]) c "$(echo "${A_C:?}" | cut -f"$1")" ;;
  [0-9]*.[0-9]*.[0-9]*.[0-9]*:[0-9]*) adb connect "$1" ;;
  ls) echo "${A_C:?}" ;;
  *) asdf current "$@" ;;
  esac
}

c "$@"
