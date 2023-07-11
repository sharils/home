#!/usr/bin/env sh

p() {
  case "$1" in
  g)
    shift
    case "$1" in
    a) shift && mix phx.gen.auth "$@" ;;
    e) shift && mix phx.gen.embedded "$@" ;;
    h) shift && mix phx.gen.html "$@" ;;
    j) shift && mix phx.gen.json "$@" ;;
    l) shift && mix phx.gen.live "$@" ;;
    n) shift && mix phx.gen.notifier "$@" ;;
    p) shift && mix phx.gen.presence "$@" ;;
    r) shift && mix phx.gen.release "$@" ;;
    *) mix phx.gen "$@" ;;
    esac
    ;;
  i) shift && iex -S mix phx.server "$@" ;;
  n) shift && mix phx.new "$@" ;;
  s) shift && mix phx.server "$@" ;;
  v) shift && mix phx.new --version "$@" ;;
  esac
}

p "$@"
