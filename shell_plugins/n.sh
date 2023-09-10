#!/usr/bin/env sh

n() {
  cmd="$("$SHARILS_HOME/shell_plugins/n/alias.sh" "$@")"
  if [ -n "$cmd" ]; then
    n y "$cmd"
    return
  fi

  case $1 in

  S) shift && n start "$@" ;;

  a) shift && n android "$@" ;;

  b) shift && n build "$@" ;;

  dg)
    shift
    for last in "$@"; do :; done
    z t "$(basename "${last%#*}")"
    n degit "$@"
    ;;

  ef) cmd="${1:-.env}" && shift && NPM_CONFIG_ENV_FILE="$cmd" "$@" ;;

  jq) shift && jq <package.json "$@" ;;

  lpd) shift && NPM_CONFIG_LEGACY_PEER_DEPS='1' "$@" ;;

  lv) shift && NPM_CONFIG_LOGLEVEL='verbose' "$@" ;;

  r) shift && n run "$@" ;;

  rg) shift && rg "$@" package.json ;;

  w) shift && n web "$@" ;;

  cnc) shift && n clear-npx-cache "$@" ;;

  agpl | clear-npx-cache | bs | bsd | d | e | g | i | gi | graphql-codegen | krampus | l | mkcert | p | pkill | serve | tsc | vercel | y | yo) cmd="$1" && shift && "$SHARILS_HOME/shell_plugins/n/$cmd.sh" "$@" ;;

  *)
    tmp="$(npm pkg get "scripts.$1" 2>/dev/null)"
    if [ -n "$tmp" ] && [ "$tmp" != '{}' ]; then
      tmp="$1" && shift && set -- run "$tmp" -- "$@"
    fi
    npm "$@"
    ;;

  esac
}
