#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

cert() {
  servername="${1:-example.com}"
  printf Q | openssl s_client -showcerts -servername "$servername" -connect "$servername:443" | openssl x509 -text | bat --style=plain
}

cert "$@"
