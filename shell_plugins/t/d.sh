#!/usr/bin/env sh

d() {
  case "$1" in
  d) shift && v -d "$TODO_FILE" "$TODO_DIR/$DONE_FILE" ;;

  sc)
    shift
    v -d "$TODO_DIR"/todo.sync-conflict-*.txt "$TODO_FILE"
    rm -i "$TODO_DIR"/todo.sync-conflict-*.txt
    ;;

  su) shift && v -d "$TODO_SU" "$TODO_FILE" ;;
  esac
}

d "$@"
