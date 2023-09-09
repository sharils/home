#!/usr/bin/env sh

bind() {
  bind -p | grep --color=never ^#
  bind -p | grep '"[^"]\+"' | grep -v 'self-insert\|do-lowercase-version\|digit-argument' | grep "$*"
}

bind "$@"
