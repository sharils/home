#!/usr/bin/env sh

b() {
  base="$(basename "$PWD" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^[:alnum:]]+/-/g')"
  name="${base}_$USER"
  tag="$base/$USER"
  case "$1" in
  r) shift && docker run --interactive --rm --tty --name "$name" "$tag" "$@" ;;

  rmi) shift && docker rmi "$tag" "$@" ;;

  s) docker stop "$name" ;;

  t)
    target="$2" && shift 2
    b --target "$target" "${@:-.}"
    ;;

  *)
    cat <<EOF >&2
# DOCKER_DEFAULT_PLATFORM=linux/amd64 docker build --tag "$tag" "${@:-.}" # prefix for AWS
EOF
    docker build --tag "$tag" "${@:-.}"
    ;;
  esac
}

b "$@"
