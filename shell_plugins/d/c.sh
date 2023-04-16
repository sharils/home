#!/usr/bin/env sh

c() {
  case "$1" in
  b) shift && c build "$@" ;;
  d) shift && c down "$@" ;;
  e) shift && $EDITOR "${@:-docker-compose.yml}" ;;
  l) shift && c logs "${@:---follow}" ;;
  p) shift && c --profile "$@" ;;
  r) shift && c run "$@" ;;
  rs) shift && c restart "$@" ;;
  s) shift && c start "$@" ;;
  u)
    shift
    case "$1" in
    b) shift && set -- --build "$@" ;;
    esac
    c up "$@"
    ;;
  x) shift && c exec "$@" ;;
  *) docker compose "$@" ;;
  esac
}

c "$@"
