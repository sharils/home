#!/usr/bin/env sh

krampus() {
  # Named after https://www.npmjs.com/package/krampus
  pid="$(lsof -ti "tcp:$*")"
  kill -TERM "$pid" || kill -KILL "$pid"
}

krampus "$@"
