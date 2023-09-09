#!/usr/bin/env sh

d() {
  case "$1" in

  -1) (set -x && date -ujf%s -v-1S 0 "${@:-+%+%t%G-W%V}") ;;

  -v)
    [ $# -eq 0 ] && echo 'd -v +3d 2023-02-24 %F' >&2 && return $?
    v="$1" && f="${3:-%F}" && d="${2:-$(date +"$f")}" && shift 3
    date -jf"$f" -v"$v" "$d" +"$f"
    ;;

  0) date -ujf%s 0 "${@:-+%FT%T}" ;;

  F) date +%F ;;

  I) date -Iseconds "$@" | sed 's/:00$//;s/+00$/Z/' | tr -d '[:space:]' ;;

  a) direnv allow ;;

  b) shift && "$SHARILS_HOME/shell_plugins/d/b.sh" "$@" ;;

  c) shift && "$SHARILS_HOME/shell_plugins/d/c.sh" "$@" ;;

  cmd) shift && "$SHARILS_HOME/shell_plugins/d/cmd.sh" "$@" ;;

  copy)
    z t_init
    (
      g cl t --quiet "$PWD"
      find -- * -type d -depth 0 -exec echo COPY {} /workdir/{} \;
      echo "COPY $(find -- * ! -name CHANGELOG.md ! -name Dockerfile ! -name README.md ! -name LICENSE ! -name docker-compose.yml -type f -depth 0 -exec echo {} \+) /workdir"
    )
    ;;

  default.conf.template) shift && "$SHARILS_HOME/shell_plugins/d/default.conf.template.sh" "$@" ;;

  e) shift && "$SHARILS_HOME/shell_plugins/d/e.sh" "$@" ;;

  i) shift && "$SHARILS_HOME/shell_plugins/d/i.sh" "$@" ;;

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

  r) shift && "$SHARILS_HOME/shell_plugins/d/r.sh" "$@" ;;

  q) osascript -e 'quit app "Docker"' ;;

  s)
    case "$1" in
    p) shift && set -- prune "$@" ;;
    esac
    d system "$@"
    ;;

  v) shift && "$SHARILS_HOME/shell_plugins/d/v.sh" "$@" ;;

  x) d exec "$@" ;;

  swagger-codegen) shift && "$SHARILS_HOME/shell_plugins/d/swagger-codegen.sh" "$@" ;;

  *)
    if [ -f "$1" ] && [ -f "$2" ]; then
      delta "$@"
    else
      docker "$@"
    fi
    ;;

  esac
}
