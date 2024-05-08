#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

o() {
  case "$1" in
  s) shift && open "$("$SHARILS_HOME/shell_plugins/z/s.sh" "$@")" ;;
  sc)
    shift
    hostname="${1:-example.com}" && shift
    port="${2:-443}" && shift
    openssl s_client -connect "$hostname:$port" </dev/null 2>&1 >/dev/null | sed '/^DONE$/d' | sed '/^verify return:1$/d'
    openssl s_client -connect "$hostname:$port" </dev/null 2>/dev/null | openssl x509 -noout -dates -email 2>/dev/null
    ;;
  *) open "${@:-.}" ;;
  esac
}

o "$@"
