#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

til() {
  python -c 'import sys;from datetime import *;print(datetime.strptime(sys.argv[1], "%Y-%m-%dT%H:%M:%S") - datetime.now())' "${@:-$("$SHARILS_HOME/shell_plugins/x/ss.sh" | sed -n '/civil_twilight_begin/p' | sed 's/  */\t/' | cut -f2)}"
}

til "$@"
