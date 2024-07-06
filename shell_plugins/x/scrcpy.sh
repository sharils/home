#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x_scrcpy() {
  case "$1" in
  [1-9])
    idx="$1" && shift
    set -- --serial "$(echo "${X_SCRCPY:?}" | cut -f"$idx")" "$@"
    ;;
  esac
  scrcpy --stay-awake --turn-screen-off --shortcut-mod=lalt,ralt "$@"
}

x_scrcpy "$@"
