#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

js() {
  proto_files="$2" && shift 2 && out_dir="${1:-.}" && shift
  "$HOMEBREW_PREFIX/opt/protobuf@3/bin/protoc" --js_out="import_style=commonjs,binary:$out_dir" "$@" "$proto_files"
}

js "$@"
