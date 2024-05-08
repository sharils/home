#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

p_protoc() {
  case "$1" in
  cs) lang=csharp ;;
  kt) lang=kotlin ;;
  py) lang=python ;;
  rb) lang=ruby ;;
  *) lang="$1" ;;
  esac
  proto_files="${2:?}" && shift 2
  protoc "--${lang}_out" "${@:-.}" "$proto_files"
}

p_protoc "$@"
