#!/usr/bin/env sh

p() {
  case "$1" in
  e) shift && p --editor "$EDITOR" "$@" ;;
  '' | *[!0-9]*) "$SHARILS_HOME/shell_plugins/t/oot.sh" post "$@" ;;
  *) todo.sh pri "$@" ;;
  esac
}

p "$@"
