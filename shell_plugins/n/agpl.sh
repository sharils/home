#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

agpl() {
  npx --yes license AGPL-3.0 "$@"
}

agpl "$@"
