#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

percent() {
  if [ $# -eq 0 ]; then
    for cmd in datetime date time year month week day hour minute second timezone literal extension etc; do
      percent "$cmd"
    done
    return
  fi

  cmd="$1" && shift && "$SHARILS_HOME/shell_plugins/k/%/$cmd.sh" "$@"
}

percent "$@"
