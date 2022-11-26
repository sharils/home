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

  n) toot notifications "${@:---reverse}" ;;

  p)
    case "$cmd" in
    1..999) todo.sh pri "$@" ;;
    *) toot post "${@:---editor=nano}" ;;
    esac
    ;;

  rc) rm ~/Sync/todo/todo.sync-conflict-*.txt ;;

  t)
    x focus_mode && echo >&2 focus mode && return
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
