#!/usr/bin/env sh

t_su() {
  if [ $# -eq 0 ]; then
    toot auth --no-color | grep @ | cut -d' ' -f2
    return
  fi

  if "$SHARILS_HOME/shell_plugins/t/is_todo.sh" "$@"; then
    TODO_FILE="$TODO_SU" todo.sh "$@"
    return
  fi

  auth="$(t_su | grep "$1" | fzf --select-1 --height=~14 --layout=reverse)" && shift
  echo "TOOT_USING=$auth" >&2
  TOOT_USING="${auth:?}" "$SHARILS_HOME/shell_plugins/t/oot.sh" "$@"
}

t_su "$@"
