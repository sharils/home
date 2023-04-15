#!/usr/bin/env sh

clear_npx_cache() {
  find "$(npm config get cache)/_npx" -depth 2 -name 'package.json' | while IFS= read -r package; do
    if [ "$(jq -r '.dependencies | keys | first' <"$package")" = "${1:?}" ]; then
      (set -x && rm -fr "${package%/package.json}")
      return
    fi
  done
}

clear_npx_cache "$@"
