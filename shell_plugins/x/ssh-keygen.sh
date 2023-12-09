#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

x_ssh_keygen() {
  ssh-keygen -f ~/.ssh/id_ed25519 -t ed25519 -C "${@:?email?}"
  pbcopy <~/.ssh/id_ed25519.pub
  pbpaste
  cp ~/.ssh/id_ed25519.pub "$HOME/.ssh/$*.pub"
}

x_ssh_keygen "$@"
