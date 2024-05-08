#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

brew() {
  cat <<'EOF'
# macOS command line utility to configure multi-display resolutions and arrangements. Essentially XRandR for macOS.
brew install jakehilborn/jakehilborn/displayplacer
EOF
}

brew "$@"
