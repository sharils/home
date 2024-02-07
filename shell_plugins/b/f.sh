#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

f() {
  BROWSER=/Applications/Firefox.app/Contents/MacOS/firefox
  case "$1" in
  sc) $BROWSER "about:certificate?cert=$(openssl s_client -connect example.com:443 2>/dev/null </dev/null |
    sed -n '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' |
    sed '/^-/d' |
    tr -d \\n |
    jq --raw-input --raw-output @uri
  )" ;;
  *) BROWSER=$BROWSER "$@" ;;
  esac
}

f "$@"
