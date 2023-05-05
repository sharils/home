#!/usr/bin/env sh

u() {
  sudo --validate
  brew update
  # for less sudo timeout
  for outdated in $(brew outdated); do
    sudo --validate
    brew upgrade "$outdated"
  done
  sudo --validate
  which rustup >/dev/null && rustup update stable
  sudo --reset-timestamp

  tldr --update
  npm --global update
  pip3 list --outdated
}

u "$@"
