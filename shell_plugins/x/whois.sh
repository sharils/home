#!/usr/bin/env sh

whois() {
  # support whois -b example.com
  for name in "$@"; do :; done
  whois -c "${name##*.}" "$@"
}

whois "$@"
