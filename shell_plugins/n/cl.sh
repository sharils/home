#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

cl() {
  # https://github.com/oscarotero/keep-a-changelog#cli
  case "$1" in
  c) shift && set -- --create "${@:?n cl c x.y.z}" ;;
  e) shift && vim '+/^##' ./CHANGELOG.md && return $? ;;
  i) shift && set -- --init "$@" ;;
  l) shift && set -- --latest-release "$@" ;;
  r) shift && set -- --release "$@" ;;
  esac
  npx --yes keep-a-changelog "$@"
}

cl "$@"
