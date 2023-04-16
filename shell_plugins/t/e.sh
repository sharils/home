#!/usr/bin/env sh

e() {
  case "$1" in
  q) shift && $EDITOR "$@" "$TODO_DIR/QuickNote.md" ;;
  t) shift && $EDITOR "$@" "$TODO_FILE" ;;
  *[!0-9]*) $EDITOR "$@" "$TODO_FILE" ;;
  *)
    cmd="$1" && shift
    $EDITOR "+$cmd" "$@" "$TODO_FILE"
    ;;
  esac
}

e "$@"
