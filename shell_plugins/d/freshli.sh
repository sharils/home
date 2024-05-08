#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

freshli() {
  docker run --rm corgibytes/freshli-cli --version
}

freshli "$@"
