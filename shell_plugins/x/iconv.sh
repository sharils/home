#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x_iconv() {
  [ $# -eq 1 ] && set -- Big5 "$@"
  iconv -t UTF-8 -f "$@"
}

x_iconv "$@"
