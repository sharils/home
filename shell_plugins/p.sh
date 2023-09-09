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
    p r c "$@"
    ;;

  e) shift && $EDITOR "$@" pyproject.toml ;;

  i) shift && poetry install "$@" ;;

  m)
    shift
    case "$1" in
    c) shift && set -- check "$@" ;;
    csu) shift && set -- createsuperuser "$@" ;;
    db) shift && set -- dbshell "$@" ;;
    e)
      shift && $EDITOR "$@" ./**/settings.py
      return
      ;;
    h) shift && set -- help "$@" ;;
    m) shift && set -- migrate "$@" ;;
    mm) shift && set -- makemigrations "$@" ;;
    rs) shift && set -- runserver "$@" ;;
    sa) shift && set -- startapp --verbosity 2 "${@:-"$(basename "$PWD" | sed 's/[^[:alnum:]]\{1,\}/_/g')_app"}" ;;
    sh) shift && set -- shell "$@" ;;
    sm) shift && set -- sqlmigrate "$@" ;;
    t)
      shift
      case "$1" in
      w)
        watchman-make --pattern '**/*.py' --run 'poetry run python manage.py test'
        return
        ;;
      esac
      set -- test "$@"
      ;;
    esac
    "$SHARILS_HOME/shell_plugins/p/r.sh" p manage.py "$@"
    ;;

  r) shift && "$SHARILS_HOME/shell_plugins/p/r.sh" "$@" ;;

  rm) shift && poetry remove "$@" ;;

  venv) x venv "$(poetry env info --path)" ;;

  *) echo not implemented >&2 ;;

  esac
}
