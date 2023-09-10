#!/usr/bin/env sh

tsc() {
  npx --yes tsc --noEmit "$@"
}

tsc "$@"
