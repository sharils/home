#!/usr/bin/env sh

x_zip() {
  zip --encrypt --recurse-paths ~"/Downloads/$(date -uIseconds | sed 's#+00:00$#Z#;s#[^[:digit:]T]##g').zip" "$@"
}

x_zip "$@"
