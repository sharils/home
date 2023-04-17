#!/usr/bin/env sh

whois() {
  # support whois -b example.com
  for name in "$@"; do :; done
  /usr/bin/env whois -c "${name##*.}" "$@"
}

whois "$@"
