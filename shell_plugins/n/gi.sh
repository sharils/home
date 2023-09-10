#!/usr/bin/env sh

gi() {
  npx --yes gitignore "${@:-node}"
}

gi "$@"
