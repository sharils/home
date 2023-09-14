#!/usr/bin/env sh

m() {
  if [ -f "$1" ]; then
    proto_files="$1" && shift
    protoc "--objc_out" "${@:-.}" "$proto_files"
    return $?
  fi

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
}

m "$@"
