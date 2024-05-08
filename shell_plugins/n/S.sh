#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

S() {
  npm start "$@"
}

S "$@"
