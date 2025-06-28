#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

t() {
  case "$1" in
  n | t | ui) x focus && echo focus! >&2 && return ;;
  esac

  if cmd="$("$SHARILS_HOME/shell_plugins/t/is_todo.sh" "$@")"; then
    if [ "$(osascript -e 'tell application "System Events" to (name of processes) contains "Syncthing"')" = 'false' ]; then
      echo 'Syncthing?' >&2
      return
    fi
    shift && set -- "$cmd" "$@"
    case "$cmd" in
    ls | list | s | stale)
      todo.sh "$@" | grep -v 'vim:filetype=todo'
      ;;
    *)
      todo.sh "$@"
      ;;
    esac
    return
  fi

  case $1 in

  auth) shift && "$SHARILS_HOME/shell_plugins/t/oot.sh" auth "$@" ;;

  b)
    shift
    if [ $# -eq 0 ]; then
      w t ls "$@"
      return
    fi
    cmd="$1" && shift
    b "$cmd" w t ls "$@"
    ;;

  cl) shift && "$SHARILS_HOME/shell_plugins/t/cl.sh" "$@" ;;

  d) shift && "$SHARILS_HOME/shell_plugins/t/d.sh" "$@" ;;

  diary) shift && "$SHARILS_HOME/shell_plugins/t/diary.sh" "$@" ;;

  e) shift && "$SHARILS_HOME/shell_plugins/t/e.sh" "$@" ;;

  n) shift && "$SHARILS_HOME/shell_plugins/t/oot.sh" notifications "${@:---reverse}" ;;

  o) shift && open "$TODO_DIR" ;;

  p) shift && "$SHARILS_HOME/shell_plugins/t/p.sh" "$@" ;;

  l) shift && "$SHARILS_HOME/shell_plugins/t/l.sh" "$@" ;;

  rc) shift && rm "$TODO_DIR"/todo.sync-conflict-*.txt ;;

  su) shift && "$SHARILS_HOME/shell_plugins/t/su.sh" "$@" ;;

  t) shift && "$SHARILS_HOME/shell_plugins/t/oot.sh" thread "$@" ;;

  ui) shift && "$SHARILS_HOME/shell_plugins/t/oot.sh" tui "$@" ;;

  w) shift && "$SHARILS_HOME/shell_plugins/t/w.sh" "$@" ;;

  yue) shift && "$SHARILS_HOME/shell_plugins/t/yue.sh" "$@" ;;

  *) tldr "$@" ;;

  esac
}
