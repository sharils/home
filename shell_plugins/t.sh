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

  rc) rm ~/Sync/todo/todo.sync-conflict-*.txt ;;

  t)
    cmd="${1-post}"
    shift
    toot "$cmd" "$@"
    ;;

  ui) t t tui "$@" ;;

  vc) vimdiff ~/Sync/todo/todo.txt ~/Sync/todo/todo.sync-conflict-*.txt ;;

  z) cd ~/Sync/todo || return ;;

  *) todo.sh "$cmd" "$@" ;;

  esac
}
