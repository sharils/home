#!/usr/bin/env sh

t() {
  case "$1" in
  n | t | ui) x focus_mode && echo >&2 focus mode && return ;;
  esac

  cmd=$1
  shift
  case $cmd in

  A)
    [ -f ~/Sync/todo/"$1" ] || touch ~/Sync/todo/"$1"
    todo.sh addto "$@"
    ;;

  Z) todo.sh archive "$@" ;;

  aw) t A work.txt "$@" ;;

  e)
    cmd="${1:-t}"
    shift
    case "$cmd" in
    q) cmd=QuickNote.md ;;
    t) cmd=todo.txt ;;
    w) cmd=work.txt ;;
    esac
    $EDITOR ~/Sync/todo/"$cmd"
    ;;

  h) todo.sh -vv help ;;

  n) t oot notifications "${@:---reverse}" ;;

  oot) toot "$@" ;;

  p)
    case "$cmd" in
    1..999) todo.sh pri "$@" ;;
    *) t oot post "${@:---editor=vim}" ;;
    esac
    ;;

  rc) rm ~/Sync/todo/todo.sync-conflict-*.txt ;;

  t)
    if [ $# -eq 1 ] && expr "$1" : "[0-9][0-9]*" >/dev/null; then
      t oot thread "$@"
    else
      t oot timeline "$@"
    fi
    ;;

  tl) t t --local --reverse --count 1 "${@:---public}" ;;

  tp) t t --public --reverse --count 1 "$@" ;;

  tt) t t --reverse --count 1 --tag "$@" ;;

  ui) t oot tui "$@" ;;

  vc) vimdiff ~/Sync/todo/todo.txt ~/Sync/todo/todo.sync-conflict-*.txt ;;

  w) t oot whois "${@:-$TOOT_WHOAMI}" ;;

  *) todo.sh "$cmd" "$@" ;;

  esac
}
