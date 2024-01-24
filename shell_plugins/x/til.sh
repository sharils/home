#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

til() {
  [ $# -eq 0 ] && set -- cb "$@"
  case "$1" in
  1930) set -- "$(date +%FT19:30:00)" "$@" ;;
  *) key="$1" && shift && set -- "$("$SHARILS_HOME/shell_plugins/x/ss.sh" "$key")" "$@" ;;
  esac
  python -c 'import sys;from datetime import *;print(datetime.strptime(sys.argv[1], "%Y-%m-%dT%H:%M:%S") - datetime.now())' "$@"
}

til "$@"
