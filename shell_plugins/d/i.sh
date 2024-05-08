#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

i() {
  case "${1:-ls}" in
  -aq) shift && docker image -aq "$@" ;;
  p) shift && i prune "$@" ;;
  s)
    shift
    for image in "$@"; do :; done
    image="$(echo "$image" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^[:alnum:]]+/-/g').tar.gz"
    i save "$@" | gzip >"$image"
    echo "docker load <$image # to load image" >&2
    ;;
  v) shift && open "https://hub.docker.com/r/$1" ;;
  *) docker image "${@:-ls}" ;;
  esac
}

i "$@"
