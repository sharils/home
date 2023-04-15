#!/usr/bin/env sh

tree() {
  cmd="${*:-$HOME/Sync/Camera}"
  cd "$cmd" && find . -print | sed "s#[^/]*/#|____#g;s#____|# |#g;1s#.*#$cmd#"
}

tree "$@"
