#!/usr/bin/env sh

t() {
  cmd=$1
  shift

  case $cmd in

  A)
    [ -f ~/Sync/todo/"$1" ] || touch ~/Sync/todo/"$1"
    todo.sh addto "$@"
    ;;

  Z) todo.sh archive "$@" ;;

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

  tp) t t --public --reverse --count 1 "$@" ;;

  tt) t t --reverse --count 1 --tag "$@" ;;

  ui) toot tui "$@" ;;

  vc) vimdiff ~/Sync/todo/todo.txt ~/Sync/todo/todo.sync-conflict-*.txt ;;

  w) toot whois "${@:-$TOOT_WHOAMI}" ;;

  *) todo.sh "$cmd" "$@" ;;

  esac
}
