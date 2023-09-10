#!/usr/bin/env sh

g() {
  NPM_CONFIG_GLOBAL='1' npm "$@"
}

g "$@"
