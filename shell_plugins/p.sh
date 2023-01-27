#!/usr/bin/env sh

p() {
  cmd="$1"
  shift
  case "$cmd" in

  '') python ;;

  I) poetry init "$@" ;;

  a)
    case "$1" in
    D)
      shift
      poetry --group dev "$@"
      ;;
    *) poetry add "$@" ;;
    esac
    ;;

  i) poetry install "$@" ;;

  m)
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
    case "$1" in
    p)
      shift
      poetry run python "$@"
      ;;
    *) poetry run "$@" ;;
    esac
    ;;

  rm) poetry remove "$@" ;;

  venv)
    # shellcheck source=/dev/null
    cmd="$(poetry env info --path)" && x venv "$cmd"
    ;;

  *) echo not implemented >&2 ;;

  esac
}
