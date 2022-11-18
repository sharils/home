#!/usr/bin/env sh

n() {
  cmd="$1"
  shift

  case $cmd in

  baapan | browser-sync | bundle-phobia | codesandbox | composerize | csv2json | cypress | eslint | gitignore | jscodeshift | jscpd | license | lighthouse | newman | nginx-linter | npkill | npm-check | npm-check-updates | npm-merge-driver | nx | packagephobia-cli | pegjs | prettier | prettier-package-json | qrcode-terminal | react-native | selenium-side-runner | trucker | vercel | wait-on) npx --yes "$cmd" "$@" ;;

  expo-app | next-app | nx-workspace | react-app | react-native-app) npm init --yes "$cmd" -- "$@" ;;

  bs) n browser-sync --no-open --watch "$@" ;;

  clear-npx-cache)
    find "$(npm config get cache)/_npx" -depth 2 -name 'package.json' | while IFS= read -r package; do
      if [ "$(jq -r '.dependencies | keys | first' <"$package")" = "${1:?}" ]; then
        echo >&2 + rm -fr "$(dirname "$package")"
        rm -fr "$(dirname "$package")"
        return
      fi
    done
    ;;

  esl)
    if [ $# -eq 0 ]; then
      n eslint --fix .
    else
      n eslint "$@"
    fi
    ;;

  gi) n gitignore "${@:-node}" ;;

  krampus)
    # Named after https://www.npmjs.com/package/krampus
    pid="$(lsof -ti "$*")"
    kill -TERM "$pid" || kill -KILL "$pid"
    ;;

  na)
    cmd="$1"
    shift
    n nx-workspace --name "$(basename "$PWD")" --preset next --appName "${cmd:-appName}" --style scss --nxCloud "$@"
    ;;

  ncu) n npm-check-updates "$@" ;;

  qt) n qrcode-terminal "$@" ;;

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
