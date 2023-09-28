#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

web() {
  case "$1" in
  dts) import_style='commonjs+dts' ;;
  ts) import_style='typescript' ;;
  web) import_style='commonjs' ;;
  esac
  proto_files="${2:?}" && shift 2 && out_dir="${1:-.}" && shift
  protoc --grpc-web_out="import_style=$import_style,mode=grpcwebtext:$out_dir" "$proto_files"
}

web "$@"
