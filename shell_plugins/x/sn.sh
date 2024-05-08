#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

sn() {
  # shellcheck disable=2087
  ssh no sh <<EOF
set -o errexit -o nounset -o xtrace
for arg in $@; do
  curl --location --continue-at - --output sn/sn-\$arg.mp3 https://media.grc.com/sn/sn-\$arg.mp3
done
EOF
}

sh "$@"
