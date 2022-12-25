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
    c)
      v d ~/Sync/todo/todo.txt ~/Sync/todo/todo.sync-conflict-*.txt
      rm -i ~/Sync/todo/todo.sync-conflict-*.txt
      ;;
    q) $EDITOR "$@" ~/Sync/todo/QuickNote.md ;;
    t) $EDITOR "$@" ~/Sync/todo/todo.txt ;;
    w) $EDITOR "$@" ~/Sync/todo/work.txt ;;
    esac
    ;;

  h) todo.sh -vv help ;;

  n) t oot notifications "${@:---reverse}" ;;

  oot)
    if [ -n "$TOOT_USING" ]; then
      toot "$@" --using "$TOOT_USING"
    else
      toot "$@"
    fi
    ;;

  p)
    case "$1" in
    '' | *[!0-9]*) t oot post "${@:---editor}" ;;
    *) todo.sh pri "$@" ;;
    esac
    ;;

  r) t replace "$@" ;;

  rc) rm ~/Sync/todo/todo.sync-conflict-*.txt ;;

  su)
    cmd="$1"
    shift
    case "$cmd" in
    *[!0-9]*)
      if [ ${#cmd} -le 1 ]; then
        t su 1 "$cmd" "$@"
        return
      fi
      auth="$(echo "${TOOT_SU}" | xargs -n1 | grep "$cmd")"
      if [ -z "$auth" ] || [ "$(echo "$auth" | wc -l)" -ne 1 ]; then
        t su 1 "$cmd" "$@"
        return
      fi
      ;;
    *) auth="$(echo "${TOOT_SU}" | cut -d' ' -f "$cmd")" ;;
    esac
    echo "TOOT_USING=$auth" >&2
    TOOT_USING="${auth:?}" t "$@"
    ;;

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

  w)
    [ $# -eq 0 ] && cmd=whoami || cmd=whois
    t oot "$cmd"
    ;;

  *) todo.sh "$cmd" "$@" ;;

  esac
}
