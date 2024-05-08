#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

rt() {
  if [ -n "$1" ] &&
    [ "$1" != localhost ] &&
    printf %s "$1" | grep -v '\.' >/dev/null; then
    cmd="$1" && shift && set -- "$cmd.com" "$@"
  fi
  curl --location --silent "$1/robots.txt" | bat --style=plain
}

rt "$@"
