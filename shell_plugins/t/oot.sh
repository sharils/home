#!/usr/bin/env sh

oot() {
  if [ -n "$TOOT_USING" ]; then
    toot "$@" --using "$TOOT_USING"
  else
    toot "$@"
  fi
}

oot "$@"
