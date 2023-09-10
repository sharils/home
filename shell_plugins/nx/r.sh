#!/usr/bin/env sh

r() {
  target="$1" && shift
  npx --yes nx run-many --target "$target" --projects "$@"
}

r "$@"
