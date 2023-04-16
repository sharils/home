#!/usr/bin/env sh

t() {
  case "$1" in
  n | t | ui) x focus && echo focus! >&2 && return ;;
  esac

  case $1 in

  A)
    shift
    [ -f "$TODO_DIR/$1" ] || touch "$TODO_DIR/$1"
    t addto "$@"
    ;;

  Z) shift && t archive "$@" ;;

  b)
    shift
    if [ $# -eq 0 ]; then
      w t ls "$@"
      return
    fi
    cmd="$1" && shift
    b "$cmd" w t ls "$@"
    ;;

  d)
    shift
    case "$1" in
    d) shift && v -d "$TODO_FILE" "$TODO_DIR/$DONE_FILE" ;;

    sc)
      shift
      v -d "$TODO_DIR"/todo.sync-conflict-*.txt "$TODO_FILE"
      rm -i "$TODO_DIR"/todo.sync-conflict-*.txt
      ;;

    su) shift && v -d "$TODO_SU" "$TODO_FILE" ;;
    esac
    ;;

  e)
    shift
    case "$1" in
    q) shift && $EDITOR "$@" "$TODO_DIR/QuickNote.md" ;;
    t) shift && $EDITOR "$@" "$TODO_FILE" ;;
    *[!0-9]*) $EDITOR "$@" "$TODO_FILE" ;;
    *)
      cmd="$1" && shift
      $EDITOR "+$cmd" "$@" "$TODO_FILE"
      ;;
    esac
    ;;

  m) shift && t addm "$@" ;;

  n) shift && t oot notifications "${@:---reverse}" ;;

  oot)
    shift
    if [ -n "$TOOT_USING" ]; then
      toot "$@" --using "$TOOT_USING"
    else
      toot "$@"
    fi
    ;;

  p)
    shift
    case "$1" in
    e) shift && t p --editor "$EDITOR" "$@" ;;
    '' | *[!0-9]*) t oot post "$@" ;;
    *) todo.sh pri "$@" ;;
    esac
    ;;

  r)
    shift
    if [ $# -eq 0 ]; then
      tput reset
    else
      t replace "$@"
    fi
    ;;

  rc) shift && rm "$TODO_DIR"/todo.sync-conflict-*.txt ;;

  su)
    shift
    cmd="$1"
    shift
    case "$cmd" in
    '') toot auth --no-color | grep @ | sort -k3 | cut -d' ' -f2 | xargs && return ;;

    Z | add | a | addm | addto | append | app | archive | command | d | deduplicate | del | e | m | r | rm | depri | dp | done | do | help | list | ls | listall | lsa | listaddons | listcon | lsc | listfile | lf | listpri | lsp | listproj | lsprj | move | mv | prepend | prep | pri | replace | report | shorthelp) TODO_FILE="$TODO_SU" t "$cmd" "$@" && return ;;

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

    echo >&2 "TOOT_USING=$auth"
    TOOT_USING="${auth:?}" t "$@"
    ;;

  t)
    shift
    if [ $# -eq 1 ] && expr "$1" : "[0-9][0-9]*" >/dev/null; then
      t oot thread "$@"
    else
      t oot timeline "$@"
    fi
    ;;

  tl) shift && t t --local --reverse --count 1 "${@:---public}" ;;

  tp) shift && t t --public --reverse --count 1 "$@" ;;

  tt) shift && t t --reverse --count 1 --tag "$@" ;;

  ui) shift && t oot tui "$@" ;;

  w)
    shift
    [ $# -eq 0 ] && cmd=whoami || cmd=whois
    t oot "$cmd"
    ;;

  add | a | addm | addto | append | app | archive | command | deduplicate | del | rm | depri | dp | done | do | help | list | ls | listall | lsa | listaddons | listcon | lsc | listfile | lf | listpri | lsp | listproj | lsprj | move | mv | prepend | prep | pri | replace | report | shorthelp) todo.sh "$@" ;;

  *) tldr "$@" ;;

  esac
}
