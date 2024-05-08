#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

krampus() {
  # Named after https://www.npmjs.com/package/krampus
  pid="$(lsof -ti "tcp:$*")"
  kill -TERM "$pid" || kill -KILL "$pid"
}

krampus "$@"
