#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

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
  python3 -m pip install --upgrade pip
  pip3 list --outdated
  mix local.hex
  mix archive.install hex phx_new
}

u "$@"
