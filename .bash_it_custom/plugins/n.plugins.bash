#!/usr/bin/env sh

n() {
  cmd="$1"
  shift

  case $cmd in

  baapan | browser-sync | bundle-phobia | clear-npx-cache | codesandbox | composerize | csv2json | cypress | eslint | gitignore | jscodeshift | jscpd | license | lighthouse | newman | nginx-linter | npkill | npm-check | npm-check-updates | npm-merge-driver | packagephobia-cli | pegjs | prettier | prettier-package-json | qrcode-terminal | react-native | selenium-side-runner | serve | trucker | vercel | wait-on) npx --yes "$cmd" "$@" ;;

  # n nx-workspace firebase --name orgname --preset next --appName appName --style css --nxCloud
  next-app | nx-workspace | react-app | react-native-app) npm init --yes "$cmd" -- "$@" ;;

  v) n vercel --token="${VERCEL_TOKEN:?}" "$@" ;;
  *) npm "$cmd" "$*" ;;

  esac
}
