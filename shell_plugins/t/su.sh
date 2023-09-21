#!/usr/bin/env sh

t_su() {
  if [ $# -eq 0 ]; then
    toot auth --no-color | grep @ | cut -d' ' -f2
    return
  fi

  if cmd="$("$SHARILS_HOME/shell_plugins/t/is_todo.sh" "$@")"; then
    shift && set -- "$cmd" "$@"
    TODO_FILE="$TODO_SU" todo.sh "$@"
    return
  fi

  case "$1" in
  e) shift && TODO_FILE="$TODO_SU" "$SHARILS_HOME/shell_plugins/t/e.sh" "$@" ;;
  *)
    auth="$(t_su | grep "$1" | fzf --select-1 --height=~14 --layout=reverse)" && shift
    echo "TOOT_USING=$auth" >&2
    TOOT_USING="${auth:?}" "$SHARILS_HOME/shell_plugins/t/oot.sh" "$@"
    ;;
  esac
}

t_su "$@"
