#!/usr/bin/env sh

p() {
  case "$1" in

  '') p r p ;;

  I) shift && poetry init "$@" ;;

  a)
    shift
    case "$1" in
    D) shift && set -- --group dev "$@" ;;
    esac
    poetry add "$@"
    ;;

  c) shift && p r c "$@" ;;

  i) shift && poetry install "$@" ;;

  m)
    shift
    case "$1" in
    c) shift && set -- check "$@" ;;
    csu) shift && set -- createsuperuser "$@" ;;
    db) shift && set -- dbshell "$@" ;;
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
        w py 'poetry run python manage.py test'
        return
        ;;
      esac
      set -- test "$@"
      ;;
    esac
    p r p manage.py "$@"
    ;;

  r)
    shift
    case "$1" in
    c) shift && set -- coverage "$@" ;;
    p) shift && set -- python "$@" ;;
    esac
    poetry run "$@"
    ;;

  rm) shift && poetry remove "$@" ;;

  venv) x venv "$(poetry env info --path)" ;;

  *) echo not implemented >&2 ;;

  esac
}
