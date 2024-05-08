#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x_jq() {
  jq "$@" "$(find ./* -name '*.json' | fzf --select-1)" | bat --language json --style=plain
}

x_jq "$@"
