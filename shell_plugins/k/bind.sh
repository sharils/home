#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

k_bind() {
  bind -p | grep --color=never ^#
  bind -p | grep '"[^"]\+"' | grep -v 'self-insert\|do-lowercase-version\|digit-argument' | grep "$*"
}

k_bind "$@"
