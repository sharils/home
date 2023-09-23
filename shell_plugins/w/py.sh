#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

py() {
  watchman-make --pattern '**/*.py' --run "${*:-pytest}"
}

py "$@"
