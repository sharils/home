#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

dsu() {
  [ $# -eq 0 ] && set -- ls "$@"

  case "$1" in
  a | ls) ;;
  *) set -- add "$@" ;;
  esac

  TODO_FILE="$TODO_DIR/dsu.txt" todo.sh "$@"
}

dsu "$@"
