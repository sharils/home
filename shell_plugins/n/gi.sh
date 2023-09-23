#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

gi() {
  npx --yes gitignore "${@:-node}"
}

gi "$@"
