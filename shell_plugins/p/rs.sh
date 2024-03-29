#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

rs() {
  proto_files="${1:?}" && shift && out_dir="${1:-.}" && shift
  protoc --rust_out="experimental-codegen=enabled,kernel=cpp:$out_dir" "$@" "$proto_files"
}

rs "$@"
