#!/usr/bin/env sh

vercel() {
  npx --yes vercel --token="${VERCEL_TOKEN:?}" "$@"
}

vercel "$@"
