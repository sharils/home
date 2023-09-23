#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

p() {
  case "$1" in

  '') p r p ;;

  1) shift && ssh bbsu@ptt.cc ;;

  2) shift && ssh bbsu@ptt2.cc ;;

  I) shift && poetry init "$@" ;;

  a) shift && "$SHARILS_HOME/shell_plugins/p/a.sh" "$@" ;;

  c) shift && "$SHARILS_HOME/shell_plugins/p/c.sh" "$@" ;;

  e) shift && $EDITOR "$@" pyproject.toml ;;

  i) shift && poetry install "$@" ;;

  js)
    proto_files="$2" && shift 2 && out_dir="${1:-.}" && shift
    "$HOMEBREW_PREFIX/opt/protobuf@3/bin/protoc" --js_out="import_style=commonjs,binary:$out_dir" "$@" "$proto_files"
    ;;

  m) shift && "$SHARILS_HOME/shell_plugins/p/m.sh" "$@" ;;

  r) shift && "$SHARILS_HOME/shell_plugins/p/r.sh" "$@" ;;

  rm) shift && poetry remove "$@" ;;

  rs)
    proto_files="$2" && shift 2 && out_dir="${1:-.}" && shift
    protoc --rust_out="experimental-codegen=enabled,kernel=cpp:$out_dir" "$@" "$proto_files"
    ;;

  venv) x venv "$(poetry env info --path)" ;;

  w) pbpaste | tr -d '[:space:]' | pbcopy ;;

  dts | ts | web)
    case "$1" in
    dts) import_style='commonjs+dts' ;;
    ts) import_style='typescript' ;;
    web) import_style='commonjs' ;;
    esac
    proto_files="$2" && shift 2 && out_dir="${1:-.}" && shift
    protoc --grpc-web_out="import_style=$import_style,mode=grpcwebtext:$out_dir" "$proto_files"
    ;;

  cpp | cs | java | kt | php | py | pyi | rb)
    case "$1" in
    cs) lang=csharp ;;
    kt) lang=kotlin ;;
    py) lang=python ;;
    rb) lang=ruby ;;
    *) lang="$1" ;;
    esac
    proto_files="$2" && shift 2
    protoc "--${lang}_out" "${@:-.}" "$proto_files"
    ;;

  *) echo not implemented >&2 ;;

  esac
}
