#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x_ping() {
  ping "${X_PING:?}"
}

x_ping "$@"
