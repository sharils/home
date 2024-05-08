#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

whois() {
  # support whois -b example.com
  for name in "$@"; do :; done
  /usr/bin/env whois -c "${name##*.}" "$@"
}

whois "$@"
