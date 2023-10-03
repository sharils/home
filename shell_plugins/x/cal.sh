#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x_cal() {
  cal -A4 -B4
}

x_cal "$@"
