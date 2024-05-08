#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

cnc() {
  "$SHARILS_HOME/shell_plugins/n/clear-npx-cache.sh" "$@"
}

cnc "$@"
