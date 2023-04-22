#!/usr/bin/env sh

cmd() {
  echo "$@" | jq --compact-output --raw-input 'split(" ")'
}

cmd "$@"
