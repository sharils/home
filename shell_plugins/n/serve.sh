#!/usr/bin/env sh

serve() {
  [ -f cert.crt ] && [ -f cert.key ] && set -- --ssl-cert cert.crt --ssl-key cert.key
  npx --yes serve "$@"
}

serve "$@"
