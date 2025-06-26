#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

e() {
  case "$1" in
  b) shift && $EDITOR "$@" "$TODO_DIR/backlog.md" ;;
  cfg) shift && $EDITOR "$@" ~/.todo.cfg ;;
  n) shift && $EDITOR "$@" "$TODO_DIR/note.md" ;;
  q) shift && $EDITOR "$@" "$TODO_DIR/QuickNote.md" ;;
  t) shift && $EDITOR "$@" "$TODO_FILE" ;;
  *[!0-9]*) $EDITOR "$TODO_DIR/$*.txt" ;;
  *)
    cmd="$1" && shift
    $EDITOR "+$cmd" "$@" "$TODO_FILE"
    ;;
  esac
}

e "$@"
