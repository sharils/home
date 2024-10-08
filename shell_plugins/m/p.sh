#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

p() {
  case "$1" in
  g)
    shift
    (
      case "$1" in
      a) shift && mix phx.gen.auth "$@" --binary-id ;;
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
    )
    ;;
  i)
    shift
    case "$1" in
    d) shift && iex --dbg pry -S mix phx.server "$@" ;;
    *) iex -S mix phx.server "$@" ;;
    esac
    ;;
  n) shift && "$SHARILS_HOME/shell_plugins/m/p/n.sh" "$@" ;;
  r)
    shift
    router="$(find ./* ! -path './deps/*' -name router.ex -exec head -n1 {} \; | cut -d' ' -f2 | fzf --select-1)" || return $?
    mix phx.routes "$router" "$@"
    ;;
  s) shift && mix phx.server "$@" ;;
  u) shift && "$SHARILS_HOME/shell_plugins/m/p/u.sh" "$@" ;;
  v) shift && mix phx.new --version "$@" ;;
  esac
}

p "$@"
