#!/usr/bin/env sh

t() {
  case "$1" in
  n | t | ui) x focus_mode && echo >&2 focus mode && return ;;
  esac

  cmd=$1
  shift
  case $cmd in

  A)
    [ -f "$TODO_DIR/$1" ] || touch "$TODO_DIR/$1"
    t addto "$@"
    ;;

  Z) t archive "$@" ;;

  b)
    if [ $# -eq 0 ]; then
      w t ls "$@"
      return
    fi
    cmd="$1"
    shift
    b "$cmd" w t ls "$@"
    ;;

  d)
    cmd="$1"
    shift
    case "$cmd" in
    d) v d "$TODO_FILE" "$TODO_DIR/$DONE_FILE" ;;
    sc)
      v d "$TODO_FILE" "$TODO_DIR"/todo.sync-conflict-*.txt
      rm -i "$TODO_DIR"/todo.sync-conflict-*.txt
      ;;
    su) v d "$TODO_DIR/todo.txt" "$TODO_DIR/su.txt" ;;
    esac
    ;;

  e)
    cmd="${1:-t}"
    shift
    case "$cmd" in
    q) $EDITOR "$@" "$TODO_DIR/QuickNote.md" ;;
    t) $EDITOR "$@" "$TODO_FILE" ;;
    *[!0-9]*) $EDITOR "$cmd" "$@" "$TODO_FILE" ;;
    *) $EDITOR "+$cmd" "$@" "$TODO_FILE" ;;
    esac
    ;;

  m) t addm "$@" ;;

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

  rc) rm "$TODO_DIR"/todo.sync-conflict-*.txt ;;

  su)
    cmd="$1"
    shift
    case "$cmd" in
    '')
      toot auth --no-color | grep @ | sort -k3 | cut -d' ' -f2 | xargs
      return
      ;;
    Z | add | a | addm | addto | append | app | archive | command | d | deduplicate | del | e | m | r | rm | depri | dp | done | do | help | list | ls | listall | lsa | listaddons | listcon | lsc | listfile | lf | listpri | lsp | listproj | lsprj | move | mv | prepend | prep | pri | replace | report | shorthelp)
      TODO_FILE="$TODO_DIR/su.txt" t "$cmd" "$@"
      return
      ;;
    *[!0-9]*)
      if [ ${#cmd} -le 1 ]; then
        t su 1 "$cmd" "$@"
        return
      fi
      auth="$(t su | xargs -n1 | grep "$cmd")"
      if [ -z "$auth" ] || [ "$(echo "$auth" | wc -l)" -ne 1 ]; then
        t su 1 "$cmd" "$@"
        return
      fi
      ;;
    *) auth="$(t su | cut -d' ' -f "$cmd")" ;;
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

  add | a | addm | addto | append | app | archive | command | deduplicate | del | rm | depri | dp | done | do | help | list | ls | listall | lsa | listaddons | listcon | lsc | listfile | lf | listpri | lsp | listproj | lsprj | move | mv | prepend | prep | pri | replace | report | shorthelp) todo.sh "$cmd" "$@" ;;

  *) tldr "$cmd" "$@" ;;

  esac
}
