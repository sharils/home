#!/usr/bin/env sh

agpl() {
  npx --yes license AGPL-3.0 "$@"
}

agpl "$@"
