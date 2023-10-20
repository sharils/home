#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

a_ls() {
  aws lightsail "$@"
}

a_ls "$@"
