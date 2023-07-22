#!/usr/bin/env sh

e() {
  case "$#" in
  0)
    vim "$SHARILS_HOME/install"
    return $?
    ;;
  1)
    vim "$SHARILS_HOME/shell_plugins/$*.sh"
    return $?
    ;;
  esac

  tmp="$SHARILS_HOME/shell_plugins/$(echo "$*" | tr ' ' '/').sh"
  if [ -f "$tmp" ]; then
    vim "$tmp"
    return $?
  fi

  cmd="$1" && shift
  tmp="$(mktemp)"
  grep --extended-regexp --line-number --with-filename "(?:^|\|)\s+\b$*\)" "$SHARILS_HOME/shell_plugins/$cmd.sh" >"$tmp"
  set -- -q "$tmp"
  [ "$(wc -l <"$tmp" | tr -d '[:space:]')" -ge 2 ] && set -- +copen "$@"
  vim "$@"
}

e "$@"
