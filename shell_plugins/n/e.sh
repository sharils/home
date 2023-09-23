#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

e() {
  if [ $# -eq 0 ]; then
    $EDITOR ./package.json
    return $?
  fi
  case "$1" in
  m) vim "$(npm pkg get main | jq -r)" ;;
  s) vim server.js ;;
  *)
    tmp="$(mktemp)"
    grep --line-number --with-filename "$1" package.json >"$tmp"
    vim -q "$tmp"
    ;;
  esac
}

e "$@"
