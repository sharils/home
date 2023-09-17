#!/usr/bin/env sh

t() {
  case "$1" in
  n | t | ui) x focus && echo focus! >&2 && return ;;
  esac

  if cmd="$("$SHARILS_HOME/shell_plugins/t/is_todo.sh" "$@")"; then
    shift && set -- "$cmd" "$@"
    todo.sh "$@"
    return
  fi

  case $1 in

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

  n) shift && "$SHARILS_HOME/shell_plugins/t/oot.sh" notifications "${@:---reverse}" ;;

  p) shift && "$SHARILS_HOME/shell_plugins/t/p.sh" "$@" ;;

  l) shift && "$SHARILS_HOME/shell_plugins/t/l.sh" "$@" ;;

  r) shift && t replace "$@" ;;

  rc) shift && rm "$TODO_DIR"/todo.sync-conflict-*.txt ;;

  su) shift && "$SHARILS_HOME/shell_plugins/t/su.sh" "$@" ;;

  t) "$SHARILS_HOME/shell_plugins/t/oot.sh" thread "$@" ;;

  ui) shift && "$SHARILS_HOME/shell_plugins/t/oot.sh" tui "$@" ;;

  w) shift && "$SHARILS_HOME/shell_plugins/t/w.sh" "$@" ;;

  *) tldr "$@" ;;

  esac
}
