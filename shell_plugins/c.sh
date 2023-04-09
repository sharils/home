#!/usr/bin/env sh

c() {
  if ! [ -t 0 ]; then
    pbcopy "$@"
    return
  fi

  cargo "$@"
}
