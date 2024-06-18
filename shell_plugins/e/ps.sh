#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

e_ps() {
  # shellcheck disable=SC2009
  ps aux | grep -v grep | grep espanso | sort
}

e_ps "$@"
