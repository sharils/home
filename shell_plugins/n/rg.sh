#!/usr/bin/env sh

n_rg() {
  rg "$@" package.json
}

n_rg "$@"
