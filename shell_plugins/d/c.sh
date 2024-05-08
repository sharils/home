#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

c() {
  case "$1" in
  R) shift && c restart "$@" ;;
  b) shift && c build "$@" ;;
  a) shift && c attach "$@" ;;
  d) shift && c down "$@" ;;
  e) shift && $EDITOR "${@:-docker-compose.yml}" ;;
  l) shift && c logs --follow "$@" ;;
  p) shift && c --profile "$@" ;;
  r) shift && c run --rm "$@" ;;
  s) shift && c start "$@" ;;
  u)
    shift
    case "$1" in
    b) shift && set -- --build "$@" ;;
    d) shift && set -- --detach "$@" ;;
    esac
    c up "$@"
    ;;
  x) shift && c exec "$@" ;;
  *) docker compose "$@" ;;
  esac
}

c "$@"
