#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

http() {
  if [ $# -eq 0 ]; then
    for cmd in $(seq 5); do
      http "$cmd"
    done
    return
  fi

  cmd="$1" && shift && "$SHARILS_HOME/shell_plugins/k/http/$cmd.sh" "$@"
}

http "$@"
