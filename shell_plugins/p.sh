#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

p() {
  case "$1" in

  '') p r p ;;

  1) shift && ssh bbsu@ptt.cc ;;

  2) shift && ssh bbsu@ptt2.cc ;;

  I) shift && echo 'https://python-poetry.org/docs/basic-usage/#project-setup' >&2 && poetry init "$@" ;;

  a) shift && "$SHARILS_HOME/shell_plugins/p/a.sh" "$@" ;;

  c) shift && "$SHARILS_HOME/shell_plugins/p/c.sh" "$@" ;;

  g) shift && "$SHARILS_HOME/shell_plugins/p/g.sh" "$@" ;;

  e) shift && $EDITOR "$@" pyproject.toml ;;

  i) shift && poetry install "$@" || echo 'Try "p I --no-interaction"?' >&2 ;;

  js) shift && "$SHARILS_HOME/shell_plugins/p/js.sh" "$@" ;;

  m) shift && "$SHARILS_HOME/shell_plugins/p/m.sh" "$@" ;;

  r) shift && "$SHARILS_HOME/shell_plugins/p/r.sh" "$@" ;;

  rm) shift && poetry remove "$@" ;;

  rs) shift && "$SHARILS_HOME/shell_plugins/p/rs.sh" "$@" ;;

  venv) x venv "$(poetry env info --path)" ;;

  w) pbpaste | tr -d '[:space:]' | pbcopy ;;

  dts | ts | web) "$SHARILS_HOME/shell_plugins/p/web.sh" "$@" ;;

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
