#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

lighthouse() {
  npx --yes lighthouse "$@" --no-enable-error-reporting
}

lighthouse "$@"
