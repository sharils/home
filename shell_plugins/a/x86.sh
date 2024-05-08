#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x86() {
  # softwareupdate --install-rosetta --agree-to-license
  arch -x86_64 ${@:-zsh -c "bash"}
}

x86 "$@"
