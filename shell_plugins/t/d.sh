#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

d() {
  case "$1" in
  d) shift && vim -d "$TODO_FILE" "$TODO_DIR/$DONE_FILE" ;;

  q) shift && vim -d "$TODO_FILE" "$TODO_DIR/QuickNote.md" ;;

  sc)
    shift
    vim -d "$TODO_DIR"/todo.sync-conflict-*.txt "$TODO_FILE"
    rm -i "$TODO_DIR"/todo.sync-conflict-*.txt
    ;;

  su) shift && vim -d "$TODO_SU" "$TODO_FILE" ;;
  esac
}

d "$@"
