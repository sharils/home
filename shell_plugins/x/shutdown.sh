#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x_shutdown() {
  sudo shutdown -r now
}

x_shutdown "$@"
