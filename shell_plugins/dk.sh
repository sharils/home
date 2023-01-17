#!/usr/bin/env sh

dk() {
  if [ $# -eq 0 ]; then
    docker "$@"
    return
  fi
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
    *)
      echo >&2 "DOCKER_DEFAULT_PLATFORM=linux/amd64 # prefix for aws"
      dk build --tag "$tag" "${@:-.}"
      ;;
    esac
    ;;
  copies)
    z t_init
    (
      g cl t --quiet "$PWD"
      find -- * -type d -depth 0 -exec echo COPY {} /workdir/{} \;
      echo "COPY $(find -- * ! -name CHANGELOG.md ! -name Dockerfile ! -name README.md ! -name LICENSE ! -name docker-compose.yml -type f -depth 0 -exec echo {} \+) /workdir"
    )
    ;;
  default.template)
    mkdir -p ./etc/nginx/templates
    docker run --interactive --rm --tty nginx:1.23-alpine cat /etc/nginx/conf.d/default.conf >./etc/nginx/templates/default.template
    ;;
  e) dk exec "$@" ;;
  i)
    cmd="${1:-ls}"
    shift
    case "$cmd" in
    p) dk image prune "$@" ;;
    s)
      for image in "$@"; do :; done
      image="$(echo "$image" | x hostnameise).tar.gz"
      dk image save "$@" | gzip >"$image"
      echo >&2 "docker load < $image # to load image"
      ;;
    *) dk image "$cmd" "$@" ;;
    esac
    ;;
  l) dk logs "$@" ;;
  o) open -b com.docker.docker ;;
  r)
    cmd="${1:-alpine:3.17}"
    shift
    docker run --interactive --rm --tty \
      --user "$(id -u):$(id -g)" \
      --volume "$PWD:$PWD" \
      --workdir "$PWD" \
      "$cmd" "${@:-env}"
    ;;
  q) osascript -e 'quit app "Docker"' ;;
  s)
    case "$1" in
    p) shift && set -- prune "$@" ;;
    esac
    dk system "$@"
    ;;
  v) dk volume "$@" ;;
  *) docker "$cmd" "$@" ;;
  esac
}
