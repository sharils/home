#!/usr/bin/env sh

e() {
  case "${1:-install}" in
  bp) vim "$SHARILS_HOME/.bash_profile" ;;

  install) vim "$SHARILS_HOME/install" ;;

  karabiner) vim "$SHARILS_HOME/config/karabiner/karabiner.json" ;;

  tig) vim "$SHARILS_HOME/tigrc" ;;

  *)
    if [ $# -le 1 ]; then
      vim "$SHARILS_HOME/shell_plugins/$*.sh"
      return $?
    fi

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
    ;;
  esac
}

e "$@"
