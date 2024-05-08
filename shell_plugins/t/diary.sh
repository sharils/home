#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

diary() {
  vim "${@:--O}" "$TODO_DIR/dsu.txt"
}

diary "$@"
