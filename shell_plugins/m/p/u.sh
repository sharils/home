#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

u() {
  [ $# -eq 0 ] && set -- hello_elixir "$@"
  "$SHARILS_HOME/shell_plugins/m/p/n.sh" "$@" --umbrella
}

u "$@"
