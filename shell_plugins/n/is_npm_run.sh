#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

is_npm_run() {
  tmp="$(npm pkg get "scripts.$1" 2>/dev/null)"
  [ -n "$tmp" ] && [ "$tmp" != '{}' ]
}

is_npm_run "$@"
