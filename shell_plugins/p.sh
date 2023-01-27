#!/usr/bin/env sh

p() {
  case "$1" in

  '') python ;;

  I)
    shift
    poetry init "$@"
    ;;

  a)
    shift
    case "$1" in
    D)
      shift
      poetry --group dev "$@"
      ;;
    *) poetry add "$@" ;;
    esac
    ;;

  i)
    shift
    poetry install "$@"
    ;;

  m)
    shift
    case "$1" in
    c)
      shift
      p m check "$@"
      ;;
    csu)
      shift
      p m createsuperuser "$@"
      ;;
    db)
      shift
      p m dbshell "$@"
      ;;
    m)
      shift
      p m migrate "$@"
      ;;
    mm)
      shift
      p m makemigrations "$@"
      ;;
    rs)
      shift
      p m runserver "$@"
      ;;
    sa)
      shift
      p m startapp --verbosity 2 "${@:-"$(basename "$PWD" | sed 's/[^[:alnum:]]\{1,\}/_/g')_app"}"
      ;;
    sh)
      shift
      p m shell "$@"
      ;;
    sm)
      shift
      p m sqlmigrate "$@"
      ;;
    *)
      p r p manage.py "$@"
      ;;
    esac
    ;;

  r)
    shift
    case "$1" in
    p)
      shift
      poetry run python "$@"
      ;;
    *) poetry run "$@" ;;
    esac
    ;;

  rm)
    shift
    poetry remove "$@"
    ;;

  venv) x venv "$(poetry env info --path)" ;;

  *) echo not implemented >&2 ;;

  esac
}
