#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

DS_Store() {
  find ~ -name .DS_Store -delete
}

DS_Store "$@"
