#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

w() {
  while
    [ "$(curl \
      --silent \
      --write-out '%{stderr}%{http_code}\t%header{date}\n' \
      "${1:-example.com}" \
      2>&1 >/dev/null |
      tee /dev/stderr |
      cut -f1)" != 200 ]
  do
    sleep "${2:-1}"
  done
}

w "$@"
