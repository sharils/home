#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x_zip() {
  case "$1" in
  code) shift && "$SHARILS_HOME/shell_plugins/x/zip/code.sh" "$@" ;;
  *)
    if [ ! -t 0 ]; then
      set -- "$(mktemp)" "$@"
      cat >"$1"
    fi
    zip --encrypt --recurse-paths "$HOME/Downloads/$(date -uIseconds | sed 's#+00:00$#Z#;s#[^[:digit:]T]##g').zip" "$@"
    ;;
  esac
}

x_zip "$@"
