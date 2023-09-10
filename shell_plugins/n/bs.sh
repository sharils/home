#!/usr/bin/env sh

bs() {
  npx --yes browser-sync "${@:-.}" --no-open
}

bs "$@"
