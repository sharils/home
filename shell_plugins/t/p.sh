#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

p() {
  case "$1" in
  e) shift && p --editor "$EDITOR" "$@" ;;
  '' | *[!0-9]*) "$SHARILS_HOME/shell_plugins/t/oot.sh" post "${@:---editor}" ;;
  *) todo.sh pri "$@" ;;
  esac
}

p "$@"
