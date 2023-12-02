#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

knip() {
  npx --yes --package typescript --package knip -- knip "$@"
}

knip "$@"
