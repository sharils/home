#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

dv() {
  : "${1:?}${2:?}"
  alt_ver="${2%%.*}.$1.${2##*.}"
  git show "$1:$2" >"$alt_ver"
  vim -d "$alt_ver" "$2"
  rm "$alt_ver"
}

dv "$@"
