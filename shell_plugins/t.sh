#!/usr/bin/env sh

t() {
  cmd=$1
  shift

  case $cmd in

  A) todo.sh archive "$@" ;;

  e) $EDITOR ~/Sync/todo/todo.txt ~/Sync/todo/QuickNote.md ~/Sync/todo/infanoj.md ;;

  gd)
    todo.sh -p ls | while IFS= read -r todo; do
      task="$(echo "$todo" | cut -d" " -f2-)"
      grep --text "$task" ~/Sync/todo/done.txt
      echo "$todo"
    done
    ;;

  h) todo.sh -vv help ;;

  p)
    case "$cmd" in
    1..999) todo.sh pri "$@" ;;
    *) toot post "$@" ;;
    esac
    ;;

  rc) rm ~/Sync/todo/todo.sync-conflict-*.txt ;;

  ui) toot tui "$@" ;;

  vc) vimdiff ~/Sync/todo/todo.txt ~/Sync/todo/todo.sync-conflict-*.txt ;;

  *) todo.sh "$cmd" "$@" ;;

  esac
}
