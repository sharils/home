#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

# Find unused files, dependencies and exports in JavaScript and TypeScript projects
knip() {
  npx --yes --package typescript --package knip -- knip "$@"
}

knip "$@"
