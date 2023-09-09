#!/usr/bin/env sh

p() {
  case "$1" in

  '') p r p ;;

  1) shift && ssh bbsu@ptt.cc ;;

  2) shift && ssh bbsu@ptt2.cc ;;

  I) shift && poetry init "$@" ;;

  a)
    shift
    case "$1" in
    D) shift && set -- --group dev "$@" ;;
    esac
    poetry add "$@"
    ;;

  c)
    shift
    case "$1" in
    m)
      shift
      case "$1" in
      t) shift && set -- test "$@" ;;
      esac
      set -- run manage.py "$@"
      ;;
    r) shift && set -- report "$@" ;;
    esac
    "$SHARILS_HOME/shell_plugins/p/r.sh" c "$@"
    ;;

  e) shift && $EDITOR "$@" pyproject.toml ;;

  i) shift && poetry install "$@" ;;

  m) shift && "$SHARILS_HOME/shell_plugins/p/m.sh" "$@" ;;

  r) shift && "$SHARILS_HOME/shell_plugins/p/r.sh" "$@" ;;

  rm) shift && poetry remove "$@" ;;

  venv) x venv "$(poetry env info --path)" ;;

  *) echo not implemented >&2 ;;

  esac
}
