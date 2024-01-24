#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

til() {
  [ $# -eq 0 ] && set -- cb "$@"
  case "$1" in
  0715) set -- "$(date +%FT07:15:00)" "$@" ;;
  1700) set -- "$(date +%FT17:00:00)" "$@" ;;
  1930) set -- "$(date +%FT19:30:00)" "$@" ;;
  c-a) set -- "$(date -ujf%FT%T -v-10H "$("$SHARILS_HOME/shell_plugins/x/ss.sh" cb)" +%FT%T)" "$@" ;;
  n-8) set -- "$(date -ujf%FT%T -v-8H "$("$SHARILS_HOME/shell_plugins/x/ss.sh" nb)" +%FT%T)" "$@" ;;
  c-8) set -- "$(date -ujf%FT%T -v-8H "$("$SHARILS_HOME/shell_plugins/x/ss.sh" cb)" +%FT%T)" "$@" ;;
  *) key="$1" && shift && set -- "$("$SHARILS_HOME/shell_plugins/x/ss.sh" "$key")" "$@" ;;
  esac
  python -c 'import sys;from datetime import *;print(datetime.strptime(sys.argv[1], "%Y-%m-%dT%H:%M:%S") - datetime.now())' "$@"
}

til "$@"
