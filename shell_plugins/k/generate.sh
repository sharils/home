#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

generate() {
  keepassxc-cli generate "$@"
}

generate "$@"
