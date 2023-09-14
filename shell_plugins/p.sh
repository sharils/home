#!/usr/bin/env sh

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

  m) shift && "$SHARILS_HOME/shell_plugins/p/m.sh" "$@" ;;

  r) shift && "$SHARILS_HOME/shell_plugins/p/r.sh" "$@" ;;

  rm) shift && poetry remove "$@" ;;

  rs)
    proto_files="$2" && shift 2 && out_dir="${1:-.}" && shift
    protoc --rust_out="experimental-codegen=enabled,kernel=cpp:$out_dir" "$@" "$proto_files"
    ;;

  venv) x venv "$(poetry env info --path)" ;;

  *) echo not implemented >&2 ;;

  esac
}
