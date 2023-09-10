#!/usr/bin/env sh

n_jq() {
  jq <package.json "$@"
}

n_jq "$@"
