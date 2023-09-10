#!/usr/bin/env sh

w() {
  [ $# -eq 0 ] && cmd=whoami || cmd=whois
  "$SHARILS_HOME/shell_plugins/t/oot.sh" "$cmd"
}

w "$@"
