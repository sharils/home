#!/usr/bin/env sh

ssh_keygen() {
  /usr/bin/env ssh-keygen -f ~/.ssh/id_ed25519 -t ed25519 -C "${@:?}"
  pbcopy <~/.ssh/id_ed25519.pub
  pbpaste
  cp ~/.ssh/id_ed25519.pub "$HOME/.ssh/$*.pub"
}

ssh_keygen "$@"
