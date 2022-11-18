#!/usr/bin/env sh

n() {
  cmd="$1"
  shift

  case $cmd in

  baapan | browser-sync | bundle-phobia | clear-npx-cache | codesandbox | composerize | csv2json | cypress | eslint | gitignore | jscodeshift | jscpd | license | lighthouse | newman | nginx-linter | npkill | npm-check | npm-check-updates | npm-merge-driver | nx | packagephobia-cli | pegjs | prettier | prettier-package-json | qrcode-terminal | react-native | selenium-side-runner | serve | trucker | vercel | wait-on) npx --yes "$cmd" "$@" ;;

  expo-app | next-app | nx-workspace | react-app | react-native-app) npm init --yes "$cmd" -- "$@" ;;

  na)
    cmd="$1"
    shift
    n nx-workspace --name "$(basename "$PWD")" --preset next --appName "${cmd:-appName}" --style scss --nxCloud "$@"
    ;;

  ncu) npx --yes npm-check-updates "$@" ;;

  v) n vercel --token="${VERCEL_TOKEN:?}" "$@" ;;

  yo) npx --yes --package yo --package "generator-$1" yo "$@" ;;

  *)
    if script="$(npm pkg get "scripts.$cmd" 2>/dev/null)" &&
      [ "$script" != '{}' ]; then
      npm run "$cmd" -- "$@"
    else
      npm "$cmd" "$@"
    fi
    ;;

  esac
}
