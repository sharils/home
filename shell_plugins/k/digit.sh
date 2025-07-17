#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

digit() {
  keepassxc-cli generate --numeric --length "${@:-6}" | tr -d \\n | pbcopy
  pbpaste | wc
}

digit "$@"
