#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

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
    schema) shift && mix phx.gen.schema "$@" ;;
    *) mix phx.gen "$@" ;;
    esac
    ;;
  i) shift && iex -S mix phx.server "$@" ;;
  n) shift && "$SHARILS_HOME/shell_plugins/m/p/n.sh" "$@" ;;
  r) shift && mix phx.routes "$@" ;;
  s) shift && mix phx.server "$@" ;;
  v) shift && mix phx.new --version "$@" ;;
  esac
}

p "$@"
