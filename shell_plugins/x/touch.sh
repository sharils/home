#!/usr/bin/env sh

touch() {
  mkdir -pv "$(dirname "$*")"
  /usr/bin/env touch "$*"
  if [ ! -t 0 ]; then
    cat >"$*"
  fi
}

touch "$@"
