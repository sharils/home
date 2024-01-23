#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

til() {
  case "${1:-c}" in
  c) set -- "$("$SHARILS_HOME/shell_plugins/x/ss.sh" | sed -n '/civil_twilight_begin/p' | sed 's/  */\t/' | cut -f2)" "$@" ;;
  n) set -- "$("$SHARILS_HOME/shell_plugins/x/ss.sh" | sed -n '/nautical_twilight_begin/p' | sed 's/  */\t/' | cut -f2)" "$@" ;;
  esac
  python -c 'import sys;from datetime import *;print(datetime.strptime(sys.argv[1], "%Y-%m-%dT%H:%M:%S") - datetime.now())' "$@"
}

til "$@"
