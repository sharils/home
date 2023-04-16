#!/usr/bin/env sh

r() {
  cmd="${1:-alpine:3.17}" && shift
  docker run --interactive --rm --tty \
    --user "$(id -u):$(id -g)" \
    --volume "$PWD:$PWD" \
    --workdir "$PWD" \
    "$cmd" "${@:-env}"
}

r "$@"
