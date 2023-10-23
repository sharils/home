#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

n() {
  cmd="$("$SHARILS_HOME/shell_plugins/n/alias.sh" "$@")"
  if [ -n "$cmd" ]; then
    shift
    n y "$cmd" "$@"
    return
  fi

  case $1 in

  dg)
    shift
    for last in "$@"; do :; done
    z t "$(basename "${last%#*}")"
    n degit "$@"
    ;;

  ef) cmd="${1:-.env}" && shift && NPM_CONFIG_ENV_FILE="$cmd" "$@" ;;

  lpd) shift && NPM_CONFIG_LEGACY_PEER_DEPS='1' "$@" ;;

  lv) shift && NPM_CONFIG_LOGLEVEL='verbose' "$@" ;;

  a | agpl | cl | clear-npx-cache | b | bs | bsd | d | e | g | i | gi | graphql-codegen | jq | krampus | l | mkcert | p | pkill | r | rg | serve | tsc | vercel | w | wtfpl | xls | y | yo) cmd="$1" && shift && "$SHARILS_HOME/shell_plugins/n/$cmd.sh" "$@" ;;

  *)
    if "$SHARILS_HOME/shell_plugins/n/is_npm_run.sh" "$@"; then
      tmp="$1" && shift && set -- run "$tmp" -- "$@"
    fi
    npm "$@"
    ;;

  esac
}
