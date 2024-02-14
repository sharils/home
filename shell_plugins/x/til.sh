#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

til() {
  [ $# -eq 0 ] && set -- "${X_TIL:?"echo export X_TIL='' >> \$SHARILS_HOME/shell_plugins/gitignore.sh"}" "$@"
  [ $# -eq 1 ] && set -- "$@" "$(date +%FT%T)"
  [ $# -eq 2 ] && set -- "$@" '%Y-%m-%dT%H:%M:%S'
  case "$1" in

  17)
    til "${1}00"
    return $?
    ;;

  C) shift && set -- "$("$SHARILS_HOME/shell_plugins/x/ss.sh" ce)" "$@" ;;

  c-a) shift && set -- "$(date -ujf%FT%T -v-10H "$("$SHARILS_HOME/shell_plugins/x/ss.sh" cb)" +%FT%T)" "$@" ;;

  n-8) shift && set -- "$(date -ujf%FT%T -v-8H "$("$SHARILS_HOME/shell_plugins/x/ss.sh" nb)" +%FT%T)" "$@" ;;

  c-8) shift && set -- "$(date -ujf%FT%T -v-8H "$("$SHARILS_HOME/shell_plugins/x/ss.sh" cb)" +%FT%T)" "$@" ;;

  c) shift && set -- "$("$SHARILS_HOME/shell_plugins/x/ss.sh" cb)" "$@" ;;

  r) shift && set -- "$("$SHARILS_HOME/shell_plugins/x/ss.sh" sr)" "$@" ;;

  r-) shift && set -- "$(date -ujf%FT%T -v-1M "$("$SHARILS_HOME/shell_plugins/x/ss.sh" sr)" +%FT%T)" "$@" ;;

  s) shift && set -- "$("$SHARILS_HOME/shell_plugins/x/ss.sh" ss)" "$@" ;;

  5 | 7 | 9 | 11 | 13 | 15 | 19 | 21)
    til "${1}30"
    return $?
    ;;

  # https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Pattern-Matching
  [[:digit:]][[:digit:]][[:digit:]] | [[:digit:]][[:digit:]][[:digit:]][[:digit:]])
    t="$(echo "$1" | sed 's/^.\{3\}$/0&/; s/^../&:/; s/$/:00/')" && shift
    set -- "$(date +%FT"$t")" "$@"
    ;;

  esac
  py="$(
    cat <<'PYTHON'
import sys
from datetime import *

duration = datetime.strptime(sys.argv[1], sys.argv[3]) - datetime.strptime(sys.argv[2], sys.argv[3])

print(f"{sys.argv[1]}\t{str(duration)}")
PYTHON
  )"
  python -c "$py" "$@"
}

til "$@"
