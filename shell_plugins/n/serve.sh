#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

serve() {
  [ -f cert.crt ] && [ -f cert.key ] && set -- --ssl-cert cert.crt --ssl-key cert.key
  npx --yes serve "$@"
}

serve "$@"
