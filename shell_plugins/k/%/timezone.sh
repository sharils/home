#!/usr/bin/env sh

timezone() {
  cat <<SH
timezone:
  %Z: $(date +%Z)
  %z: $(date +%z)
SH
}

timezone "$@"
