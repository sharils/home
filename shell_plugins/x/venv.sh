#!/usr/bin/env sh

venv() {
  if type deactivate >/dev/null 2>&1; then
    deactivate
    return
  fi
  cmd="${1:-.venv}"
  [ ! -e "$cmd" ] && python3 -m venv "$cmd"
  cmd="$cmd/bin/activate"
  echo >&2 "+ . $cmd"
  # shellcheck source=/dev/null
  . "$cmd"
}

venv "$@"
