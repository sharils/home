#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

download_sh() {
  echo 'curl https://iterm2.com/download.sh | bash -s -- ' | pbcopy
  pbpaste
}

download_sh "$@"
