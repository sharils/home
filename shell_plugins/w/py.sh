#!/usr/bin/env sh

py() {
  watchman-make --pattern '**/*.py' --run "${*:-pytest}"
}

py "$@"
