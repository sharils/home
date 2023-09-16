#!/usr/bin/env sh

x_curl() {
  while out="$(curl --silent --proto-default 'https' --write-out '%{stderr}%{http_code}\t%header{date}\n' "${1:-example.com}" 2>&1 >/dev/null | tee /dev/stderr)"; do
    if [ "$(printf %s "$out" | cut -f1)" = 200 ]; then
      break
    else
      sleep "${2:-600}"
    fi
  done
}

x_curl "$@"
