#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x_shutdown() {
  shutdown -r now
}

x_shutdown "$@"
