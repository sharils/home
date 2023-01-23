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
      poetry --group dev "$@" ;;
    *) poetry add "$@" ;;
    esac
    ;;
  i) poetry install "$@" ;;
  m) python -m "$@" ;;
  r)
    case "$1" in
    p)
      shift
      poetry run python "$@"
      ;;
    *) poetry run "$@" ;;
    esac
    ;;
  venv)
    # shellcheck source=/dev/null
    cmd="$(poetry env info --path)" && x venv "$cmd"
    ;;
  *) echo not implemented >&2 ;;
  esac
}
