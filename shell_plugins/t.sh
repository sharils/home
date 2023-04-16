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

  d) shift && "$SHARILS_HOME/shell_plugins/t/d.sh" "$@" ;;

  e) shift && "$SHARILS_HOME/shell_plugins/t/e.sh" "$@" ;;

  m) shift && t addm "$@" ;;

  n) shift && t oot notifications "${@:---reverse}" ;;

  oot) shift && "$SHARILS_HOME/shell_plugins/t/oot.sh" "$@" ;;

  p)
    shift
    case "$1" in
    e) shift && t p --editor "$EDITOR" "$@" ;;
    '' | *[!0-9]*) t oot post "$@" ;;
    *) todo.sh pri "$@" ;;
    esac
    ;;

  r) shift && t replace "$@" ;;

  rc) shift && rm "$TODO_DIR"/todo.sync-conflict-*.txt ;;

  su)
    shift
    case "$1" in
    '') toot auth --no-color | grep @ | cut -d' ' -f2 && return ;;

    Z | add | a | addm | addto | append | app | archive | command | d | deduplicate | del | e | m | r | rm | depri | dp | done | do | help | list | ls | listall | lsa | listaddons | listcon | lsc | listfile | lf | listpri | lsp | listproj | lsprj | move | mv | prepend | prep | pri | replace | report | shorthelp) TODO_FILE="$TODO_SU" t "$@" && return ;;
    esac

    auth="$(t su | grep "$1" | x fzf)"
    shift
    echo "TOOT_USING=$auth" >&2
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
