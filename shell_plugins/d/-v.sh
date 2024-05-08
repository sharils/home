#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

d_v() {
  v="${1:-+16d}" && f="${3:-%F}" && d="${2:-$(date +"$f")}" && shift 3
  date -jf"$f" -v"$v" "$d" +"$f"
}

d_v "$@"
