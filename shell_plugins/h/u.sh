#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

u() {
  sudo --validate
  brew update
  # for less sudo timeout
  for outdated in $(brew outdated); do
    brew upgrade "$outdated"
  done
  which rustup >/dev/null && rustup update stable
  sudo --reset-timestamp

  tldr --update
  npm --global update
  python3 -m pip install --upgrade pip
  pip3 list --outdated
  mix local.hex --force
  mix archive.install hex phx_new --force
}

u "$@"
