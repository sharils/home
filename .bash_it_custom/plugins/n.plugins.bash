#!/usr/bin/env sh

n() {
  cmd="$1"
  shift

  case $cmd in

  browser-sync | bundle-phobia | baapan | clear-npx-cache | codesandbox | composerize | csv2json | cypress | eslint | gitignore | jscodeshift | jscpd | license | lighthouse | npm-check-updates | newman | nginx-linter | npkill | npm-check | npm-merge-driver | packagephobia-cli | pegjs | prettier | prettier-package-json | qrcode-terminal | react-native | selenium-side-runner | serve | trucker | vercel | wait-on) npx --yes "$cmd" "$@" ;;

  next-app | react-app) npm init "$cmd" -- "$@" ;;

  v) n vercel --token="${VERCEL_TOKEN:?}" "$@" ;;
  *) npm "$cmd" "$*" ;;

  esac
}
