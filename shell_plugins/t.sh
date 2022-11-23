#!/usr/bin/env sh

t() {
  cmd=$1
  shift

  case $cmd in

  A) todo.sh archive "$@" ;;

  e) $EDITOR ~/Sync/todo/todo.txt ~/Sync/todo/QuickNote.md ;;

  h) todo.sh -vv help ;;

  n) toot notifications "$@" ;;

  p)
    case "$cmd" in
    1..999) todo.sh pri "$@" ;;
    *) toot post "$@" ;;
    esac
    ;;

  rc) rm ~/Sync/todo/todo.sync-conflict-*.txt ;;

  t) toot timeline "$@" ;;

  tl) t t --once --local --reverse "${@:---public}" ;;

  tp) t t --once --public --reverse "$@" ;;

  ui) toot tui "$@" ;;

  vc) vimdiff ~/Sync/todo/todo.txt ~/Sync/todo/todo.sync-conflict-*.txt ;;

  w) toot whois "${@:-$TOOT_WHOAMI}" ;;

  *) todo.sh "$cmd" "$@" ;;

  esac
}
