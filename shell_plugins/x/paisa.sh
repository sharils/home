#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

paisa() {
  # https://news.ycombinator.com/item?id=37613054
  VERSION='0.5.2'
  BIN='/tmp/paisa'

  if [ ! -f "$BIN" ]; then
    curl --location --silent "https://github.com/ananthakumaran/paisa/releases/download/v$VERSION/paisa-cli-macos-amd64" >"$BIN"
    chmod -v +x "$BIN"
  fi

  case "$1" in
  s) shift && set -- serve "$@" ;;
  esac

  "$BIN" "$@"
}

paisa "$@"
