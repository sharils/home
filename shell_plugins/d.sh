#!/usr/bin/env sh

d() {
  cmd="${1:-i}"
  shift

  case $cmd in

  a) direnv allow ;;
  e) direnv edit . && chmod 600 .envrc ;;
  I) date +%Y%m%dT%H%M%S%z | sed "s/00$//" ;;
  i) date +%FT%T%z | sed "s/00$//" ;;
  U) date -u +%Y%m%dT%H%M%SZ ;;
  u) date -u +%FT%TZ ;;
  s) date -u +%s ;;
  v) date -jf %F -v"${1:-+0d}" "${2:-"$(date +%F)"}" +%F ;;
  *) date "$@" ;;

  esac
}
