#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

w() {
  [ $# -eq 0 ] && cmd=whoami || cmd=whois
  "$SHARILS_HOME/shell_plugins/t/oot.sh" "$cmd"
}

w "$@"
