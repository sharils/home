#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

o() {
  case "$1" in
  sc)
    shift
    hostname="${1:-example.com}" && shift
    port="${2:-443}" && shift
    openssl s_client -connect "$hostname:$port" </dev/null 2>&1 >/dev/null | sed '/^DONE$/d' | sed '/^verify return:1$/d'
    openssl s_client -connect "$hostname:$port" </dev/null 2>/dev/null | openssl x509 -noout 2>/dev/null -dates -email
    ;;
  *) open "${@:-.}" ;;
  esac
}

o "$@"
