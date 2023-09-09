#!/usr/bin/env sh

d_v() {
  [ $# -eq 0 ] && echo 'd -v +3d 2023-02-24 %F' >&2 && return $?
  v="$1" && f="${3:-%F}" && d="${2:-$(date +"$f")}" && shift 3
  date -jf"$f" -v"$v" "$d" +"$f"
}

d_v "$@"
