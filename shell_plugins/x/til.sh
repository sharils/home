#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

til() {
  if [ $# -eq 0 ]; then
    {
      for t in 0800 1200 1700 s C c-11.5 1900 c-9 c-8 2200 c-7.5 c; do
        printf "$t\t%s\n" "$(til "$t")"
      done
      printf "X_TIL\t%s\n" "$(til "$X_TIL")"
    } | sort -k2 | grep -E '^|^(?:c-11.5).*|^(?:c-9).*|^(?:c-7.5).*|^(?:X_TIL).*'
    return $?
  fi
  [ $# -eq 1 ] && set -- "$@" "$(date +%FT%T)"
  [ $# -eq 2 ] && set -- "$@" '%Y-%m-%dT%H:%M:%S'
  case "$1" in

  c-11.5)
    shift
    dt="$(date -ujf%FT%T -v-690M "$("$SHARILS_HOME/shell_plugins/x/ss.sh" cb)" +%FT%T)"
    while [ "$(date -jf%FT%T "$dt" +%s)" -lt "$(date +%s)" ]; do
      dt="$(date -jf%FT%T -v+1d "$dt" +%FT%T)"
    done
    set -- "$dt" "$@"
    ;;

  c-a)
    shift
    dt="$(date -ujf%FT%T -v-10H "$("$SHARILS_HOME/shell_plugins/x/ss.sh" cb)" +%FT%T)"
    while [ "$(date -jf%FT%T "$dt" +%s)" -lt "$(date +%s)" ]; do
      dt="$(date -jf%FT%T -v+1d "$dt" +%FT%T)"
    done
    set -- "$dt" "$@"
    ;;

  n-9) shift && set -- "$(date -ujf%FT%T -v-9H "$("$SHARILS_HOME/shell_plugins/x/ss.sh" nb)" +%FT%T)" "$@" ;;

  c-9)
    shift
    dt="$(date -ujf%FT%T -v-9H "$("$SHARILS_HOME/shell_plugins/x/ss.sh" cb)" +%FT%T)"
    while [ "$(date -jf%FT%T "$dt" +%s)" -lt "$(date +%s)" ]; do
      dt="$(date -jf%FT%T -v+1d "$dt" +%FT%T)"
    done
    set -- "$dt" "$@"
    ;;

  c-9.5)
    shift
    dt="$(date -ujf%FT%T -v570M "$("$SHARILS_HOME/shell_plugins/x/ss.sh" cb)" +%FT%T)"
    while [ "$(date -jf%FT%T "$dt" +%s)" -lt "$(date +%s)" ]; do
      dt="$(date -jf%FT%T -v+1d "$dt" +%FT%T)"
    done
    set -- "$dt" "$@"
    ;;

  c-8)
    shift
    dt="$(date -ujf%FT%T -v-8H "$("$SHARILS_HOME/shell_plugins/x/ss.sh" cb)" +%FT%T)"
    while [ "$(date -jf%FT%T "$dt" +%s)" -lt "$(date +%s)" ]; do
      dt="$(date -jf%FT%T -v+1d "$dt" +%FT%T)"
    done
    set -- "$dt" "$@"
    ;;

  c-7.5)
    shift
    dt="$(date -ujf%FT%T -v-450M "$("$SHARILS_HOME/shell_plugins/x/ss.sh" cb)" +%FT%T)"
    while [ "$(date -jf%FT%T "$dt" +%s)" -lt "$(date +%s)" ]; do
      dt="$(date -jf%FT%T -v+1d "$dt" +%FT%T)"
    done
    set -- "$dt" "$@"
    ;;

  c-8)
    shift
    dt="$(date -ujf%FT%T -v-8H "$("$SHARILS_HOME/shell_plugins/x/ss.sh" cb)" +%FT%T)"
    while [ "$(date -jf%FT%T "$dt" +%s)" -lt "$(date +%s)" ]; do
      dt="$(date -jf%FT%T -v+1d "$dt" +%FT%T)"
    done
    set -- "$dt" "$@"
    ;;

  c)
    shift
    dt="$(date -ujf%FT%T "$("$SHARILS_HOME/shell_plugins/x/ss.sh" cb)" +%FT%T)"
    while [ "$(date -jf%FT%T "$dt" +%s)" -lt "$(date +%s)" ]; do
      dt="$(date -jf%FT%T -v+1d "$dt" +%FT%T)"
    done
    set -- "$dt" "$@"
    ;;

  r) shift && set -- "$("$SHARILS_HOME/shell_plugins/x/ss.sh" sr)" "$@" ;;

  n) shift && set -- "$("$SHARILS_HOME/shell_plugins/x/ss.sh" sn)" "$@" ;;

  s)
    shift
    # set -- "$("$SHARILS_HOME/shell_plugins/x/ss.sh" ss)" "$@"
    dt="$(date -ujf%FT%T "$("$SHARILS_HOME/shell_plugins/x/ss.sh" ss)" +%FT%T)"
    [ "$(date -jf%FT%T "$dt" +%s)" -lt "$(date +%s)" ] && dt="$(date -jf%FT%T -v+1d "$dt" +%FT%T)"
    set -- "$dt" "$@"
    ;;

  C)
    shift
    dt="$(date -ujf%FT%T "$("$SHARILS_HOME/shell_plugins/x/ss.sh" ce)" +%FT%T)"
    while [ "$(date -jf%FT%T "$dt" +%s)" -lt "$(date +%s)" ]; do
      dt="$(date -jf%FT%T -v+1d "$dt" +%FT%T)"
    done
    set -- "$dt" "$@"
    ;;

  5 | 7 | 9 | 11 | 13 | 15 | 19 | 21)
    til "${1}30"
    return $?
    ;;

  # https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Pattern-Matching
  [[:digit:]][[:digit:]][[:digit:]] | [[:digit:]][[:digit:]][[:digit:]][[:digit:]])
    t="$(echo "$1" | sed 's/^.\{3\}$/0&/; s/^../&:/; s/$/:00/')" && shift
    dt="$(date +%FT"$t")"
    [ "$(date -jf%FT%T "$dt" +%s)" -lt "$(date +%s)" ] && dt="$(date -v+1d +%FT"$t")"
    set -- "$dt" "$@"
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
  python3 -c "$py" "$@"
}

til "$@"
