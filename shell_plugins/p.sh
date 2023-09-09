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

  venv) x venv "$(poetry env info --path)" ;;

  *) echo not implemented >&2 ;;

  esac
}
