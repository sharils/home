#!/usr/bin/env sh

is_todo() {
  case "$1" in

  m) echo addm && return 0 ;;

  r) echo replace && return 0 ;;

  z) echo archive && return 0 ;;

  add | a | addm | addto | append | app | archive | command | deduplicate | del | rm | depri | dp | done | do | help | list | ls | listall | lsa | listaddons | listcon | lsc | listfile | lf | listpri | lsp | listproj | lsprj | move | mv | prepend | prep | pri | replace | report | shorthelp)
    echo "$1" && return 0
    ;;

  *) return 1 ;;
  esac
}

is_todo "$@"
