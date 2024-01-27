#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

til() {
  [ $# -eq 0 ] && set -- c "$@"
  case "${1:-c}" in

  c-a) set -- "$(date -ujf%FT%T -v-10H "$("$SHARILS_HOME/shell_plugins/x/ss.sh" cb)" +%FT%T)" "$@" ;;

  n-8) set -- "$(date -ujf%FT%T -v-8H "$("$SHARILS_HOME/shell_plugins/x/ss.sh" nb)" +%FT%T)" "$@" ;;

  c-8) set -- "$(date -ujf%FT%T -v-8H "$("$SHARILS_HOME/shell_plugins/x/ss.sh" cb)" +%FT%T)" "$@" ;;

  c) set -- "$("$SHARILS_HOME/shell_plugins/x/ss.sh" cb)" "$@" ;;

  # https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Pattern-Matching
  [[:digit:]][[:digit:]][[:digit:]][[:digit:]])
    t="$(echo "$1" | sed 's/^../&:/; s/$/:00/')" && shift
    set -- "$(date +%FT"$t")" "$@"
    ;;

  esac
  python -c 'import sys;from datetime import *;print(datetime.strptime(sys.argv[1], "%Y-%m-%dT%H:%M:%S") - datetime.now())' "$@"
}

til "$@"
