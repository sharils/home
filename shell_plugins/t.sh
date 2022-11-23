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

  t)
    if [ $# -eq 1 ] && expr "$1" : "[0-9][0-9]*" >/dev/null; then
      toot thread "$@"
    else
      toot timeline "$@"
    fi
    ;;

  tl) t t --local --reverse --count 1 "${@:---public}" ;;

  tp) t t --once --public --reverse "$@" ;;

  tt) t t --once --tag "$@" ;;

  ui) toot tui "$@" ;;

  vc) vimdiff ~/Sync/todo/todo.txt ~/Sync/todo/todo.sync-conflict-*.txt ;;

  w) toot whois "${@:-$TOOT_WHOAMI}" ;;

  *) todo.sh "$cmd" "$@" ;;

  esac
}
