#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

vercel() {
  npx --yes vercel --token="${VERCEL_TOKEN:?}" "$@"
}

vercel "$@"
