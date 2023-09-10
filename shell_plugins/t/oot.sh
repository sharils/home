#!/usr/bin/env sh

oot() {
  [ -n "$TOOT_USING" ] && set -- "$@" --using "$TOOT_USING"
  toot "$@"
}

oot "$@"
