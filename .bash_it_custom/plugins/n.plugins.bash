#!/usr/bin/env sh

n() {
  cmd="$1"
  shift

  case $cmd in

  nc) npx --yes npm-check "$@" ;;
  *) npm "$cmd" "$*" ;;

  esac
}
