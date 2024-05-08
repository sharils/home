#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

html() {
  cmd="$1"
  shift
  case "$cmd" in
  t)
    echo '==> index.html <==' >&2
    html | tee index.html
    ;;
  *) echo '<!doctype html><html><head><meta charset="utf-8" /><meta http-equiv="Content-type" content="text/html; charset=utf-8" /><meta name="viewport" content="width=device-width, initial-scale=1" /><title>Hello HTML</title></head><body><h1>Hello HTML</h1></body></html>' ;;
  esac
}

html "$@"
