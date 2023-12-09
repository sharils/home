#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

d() {
  case "$1" in

  -1) (set -x && date -ujf%s -v-1S 0 "${@:-+%+%t%G-W%V}") ;;

  0) date -ujf%s 0 "${@:-+%FT%T}" ;;

  A) shift && "$SHARILS_HOME/shell_plugins/d/A.sh" "$@" ;;

  F) date +%F ;;

  I) date -Iseconds "$@" | sed 's/:00$//;s/+00$/Z/' | tr -d '[:space:]' ;;

  a) direnv allow ;;

  copy)
    z t_init
    (
      g cl t --quiet "$PWD"
      find -- * -type d -depth 0 -exec echo COPY {} /workdir/{} \;
      echo "COPY $(find -- * ! -name CHANGELOG.md ! -name Dockerfile ! -name README.md ! -name LICENSE ! -name docker-compose.yml -type f -depth 0 -exec echo {} \+) /workdir"
    )
    ;;

  l) d logs "$@" ;;

  o) open -b com.docker.docker ;;

  q) osascript -e 'quit app "Docker"' ;;

  roc) shift && printf 'Year %s is either Gregorian %s or ROC %s.' "${*}" "$((${*}+1911))" "$((${*}-1911))" ;;

  x) d exec "$@" ;;

  y) echo $(($(date +%Y) - $*)) ;;

  -v | b | c | cmd | default.conf | e | freshli | i | j | ladder | node-red | r | s | v | swagger-codegen) cmd="$1" && shift && "$SHARILS_HOME/shell_plugins/d/$cmd.sh" "$@" ;;

  *)
    if [ -f "$1" ] && [ -f "$2" ]; then
      delta --side-by-side "$@"
    else
      docker "$@"
    fi
    ;;

  esac
}
