#!/usr/bin/env sh

t() {
  cmd=$1
  shift

  case $cmd in
  cd)
    cd ~/Sync/todo || return
    ;;
  gd)
    todo.sh -p ls | while IFS= read -r todo; do
      task="$(echo "$todo" | cut -d" " -f2-)"
      grep --text "$task" ~/Sync/todo/done.txt
      echo "$todo"
    done
    ;;
  h)
    todo.sh -vv help
    ;;
  ls)
    todo.sh ls | grep -v " x "
    ;;
  rc)
    rm ~/Sync/todo/todo.sync-conflict-*.txt
    ;;
  v)
    vim -p ~/Sync/todo/todo.txt ~/Sync/todo/QuickNote.md
    ;;
  vc)
    vimdiff ~/Sync/todo/todo.txt ~/Sync/todo/todo.sync-conflict-*.txt
    ;;
  *)
    todo.sh "$cmd" "$@"
    ;;
  esac
}
