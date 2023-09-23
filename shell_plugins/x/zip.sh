#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x_zip() {
  zip --encrypt --recurse-paths ~"/Downloads/$(date -uIseconds | sed 's#+00:00$#Z#;s#[^[:digit:]T]##g').zip" "$@"
}

x_zip "$@"
