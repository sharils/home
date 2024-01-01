#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

tld() {
  [ -f "${tld:=/tmp/x-tld-$(date +%Y-%m).txt}" ] ||
    curl https://data.iana.org/TLD/tlds-alpha-by-domain.txt >"$tld"
  grep -i "$*" "$tld"
}

tld "$@"
