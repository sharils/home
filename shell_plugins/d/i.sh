#!/usr/bin/env sh

i() {
  case "${1:-ls}" in
  p) shift && i prune "$@" ;;
  s)
    shift
    for image in "$@"; do :; done
    image="$(echo "$image" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^[:alnum:]]+/-/g').tar.gz"
    i save "$@" | gzip >"$image"
    echo "docker load < $image # to load image" >&2
    ;;
  *) docker image "${@:-ls}" ;;
  esac
}

i "$@"
