#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

buf() {
  case "$1" in
  g) shift && set -- generate "$@" ;;
  l) shift && set -- lint "$@" ;;
  ls) shift && set -- ls-files "$@" ;;
  esac
  npx --yes --package @bufbuild/protobuf --package @bufbuild/protoc-gen-es --package @bufbuild/buf -- buf "$@"
}

buf "$@"
