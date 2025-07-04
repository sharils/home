#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

e() {
  case "$1" in
  cfg) shift && $EDITOR "$@" ~/.todo.cfg ;;
  n) shift && $EDITOR "$@" "$TODO_DIR/note.md" ;;
  q) shift && $EDITOR "$@" "$TODO_DIR/QuickNote.md" ;;
  s) shift && $EDITOR "$@" "$TODO_DIR/stale.txt" ;;
  t) shift && $EDITOR "$@" "$TODO_FILE" ;;
  *[!0-9]*) $EDITOR "$TODO_DIR/$*.txt" ;;
  *)
    cmd="$1" && shift
    $EDITOR "+$cmd" "$@" "$TODO_FILE"
    ;;
  esac
}

e "$@"
