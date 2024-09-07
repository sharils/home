#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x_traceroute() {
  traceroute "${X_TRACEROUTE:?}"
}

x_traceroute "$@"
