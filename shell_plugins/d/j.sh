#!/usr/bin/env sh

j() {
  case "$1" in
  sp)
    cmd="${2:-"$(basename "$PWD" | sed 's/[^[:alnum:]]\{1,\}/_/g')"}" && shift 2
    d j startproject --verbosity 2 "$cmd" "${@:-.}"
    ;;
  *) "$SHARILS_HOME/shell_plugins/p/r.sh" p -mdjango "$@" ;;
  esac
}

j "$@"
