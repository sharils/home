#!/usr/bin/env sh

dk() {
  cmd="$1"
  shift

  case "$cmd" in
  b)
    base="$(basename "$PWD" | x hostnameise)"
    name="${base}_$USER"
    tag="$base/$USER"
    cmd="$1"
    shift
    case "$cmd" in
    r) dk run --interactive --rm --tty --name "$name" "$@" "$tag" ;;
    rmi) dk rmi "$tag" "$@" ;;
    s) dk stop "$name" ;;
    *) dk build --tag "$tag" "${@:-.}" ;;
    esac
    ;;
  copies)
    z t_init
    (
      g clt --quiet "$PWD"
      find -- * -type d -depth 0 -exec echo COPY {} /workdir/{} \;
      echo "COPY $(find -- * ! -name CHANGELOG.md ! -name Dockerfile ! -name README.md ! -name LICENSE ! -name docker-compose.yml -type f -depth 0 -exec echo {} \+) /workdir"
    )
    ;;
  i) dk image "${@:-ls}" ;;
  o) open -b com.docker.docker ;;
  q) osascript -e 'quit app "Docker"' ;;
  s) dk system "$@" ;;
  v) dk volume "$@" ;;
  *) docker "$cmd" "$@" ;;
  esac
}
