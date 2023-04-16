#!/usr/bin/env sh

e() {
  case "${1:-install}" in
  bp) vim "$SHARILS_HOME/bash_profile" ;;
  install) vim "$SHARILS_HOME/install" ;;
  karabiner) vim "$SHARILS_HOME/config/karabiner/karabiner.json" ;;
  todo) vim "$SHARILS_HOME/todo.cfg" ;;
  tig) vim "$SHARILS_HOME/tigrc" ;;
  vim) vim "$SHARILS_HOME/vimrc" ;;
  *)
    if [ $# -le 1 ]; then
      vim "$SHARILS_HOME/shell_plugins/$*.sh"
    else
      cmd="$1" && shift
      tmp="$(mktemp)"
      grep --extended-regexp --line-number --with-filename "^\s+\b$*\)" "$SHARILS_HOME/shell_plugins/$cmd.sh" >"$tmp"
      set -- -q "$tmp"
      [ "$(wc -l < "$tmp")" -ge 2 ] && set -- +copen "$@"
      vim "$@"
    fi
    ;;
  esac
}

e "$@"
