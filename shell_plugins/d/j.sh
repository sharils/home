#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

j() {
  if [ $# -eq 0 ]; then
    date +%j
    return $?
  fi
  case "$1" in
  sp)
    cmd="${2:-"$(basename "$PWD" | sed 's/[^[:alnum:]]\{1,\}/_/g')"}" && shift 2
    d j startproject --verbosity 2 "$cmd" "${@:-.}"
    ;;
  *) "$SHARILS_HOME/shell_plugins/p/r.sh" p -mdjango "$@" ;;
  esac
}

j "$@"
