#!/usr/bin/env sh

d() {
  cmd="${1:-i}" && shift
  case $cmd in

  -1) (set -x && date -ujf%s -v-1S 0 "${@:-+%+%t%G-W%V}") ;;

  -v)
    v="$1" && cmd="$2" && shift 2
    date -jf"${*:-%F}" -v"$v" "${cmd:-$(date +"${*:-%F}")}" +"${*:-%F}"
    ;;

  0) date -ujf%s 0 "${@:-+%FT%T}" ;;

  F) date +%F ;;

  I) date -Iseconds "$@" | sed 's/:00$//;s/+00$/Z/' | tr -d '[:space:]' ;;

  a) direnv allow ;;

  b) "$SHARILS_HOME/shell_plugins/d/b.sh" "$@" ;;

  c) "$SHARILS_HOME/shell_plugins/d/c.sh" "$@" ;;

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

  e) direnv edit . && chmod 600 .envrc ;;

  i) "$SHARILS_HOME/shell_plugins/d/i.sh" "$@" ;;

  j)
    case "$1" in
    sp)
      cmd="${2:-"$(basename "$PWD" | sed 's/[^[:alnum:]]\{1,\}/_/g')"}" && shift 2
      d j startproject --verbosity 2 "$cmd" "${@:-.}"
      ;;
    *) p r p -mdjango "$@" ;;
    esac
    ;;

  l) d logs "$@" ;;

  o) open -b com.docker.docker ;;

  r) "$SHARILS_HOME/shell_plugins/d/r.sh" "$@" ;;

  q) osascript -e 'quit app "Docker"' ;;

  s)
    case "$1" in
    p) shift && set -- prune "$@" ;;
    esac
    d system "$@"
    ;;

  v) d volume "$@" ;;

  x) d exec "$@" ;;

  *) docker "$cmd" "$@" ;;

  esac
}
