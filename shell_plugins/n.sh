#!/usr/bin/env sh

n() {
  cmd="$1"
  shift

  case $cmd in

  baapan | browser-sync | bundle-phobia | chance-cli | codesandbox | composerize | cost-of-modules | covgen | csv2json | cypress | degit | eslint | gitignore | jscodeshift | jscpd | license | lighthouse | newman | nginx-linter | npkill | npm-check | npm-check-updates | npm-merge-driver | nve | nx | packagephobia-cli | pegjs | prettier | prettier-package-json | pwned | qnm | qrcode-terminal | react-native | readme-md-generator | resume-cli | selenium-side-runner | trucker | why-is-node-running | wait-on) npx --yes "$cmd" "$@" ;;

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

  d) npm docs "$@" ;;

  dg)
    for last in "$@"; do :; done
    z t "$(basename "${last%#*}")"
    n degit "$@"
    ;;

  esl)
    if [ $# -eq 0 ]; then
      n eslint --fix .
    else
      n eslint "$@"
    fi
    ;;

  gi) n gitignore "${@:-node}" ;;

  graphql-codegen) npx --yes --package graphql --package @graphql-codegen/cli -- graphql-codegen "$@" ;;

  h) npm help "$@" ;;

  i)
    cmd="$1"
    shift
    case "$cmd" in
    expo-app | next-app | node-cli | nx-workspace | react-app | react-native-app) n i y "$cmd" -- "$@" ;;
    y) npm init --yes "$@" ;;
    *) npm install "$cmd" "$@" ;;
    esac
    ;;

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

  p)
    cmd="$1"
    shift
    case "$cmd" in
    awk | eex | elm | groovy | nginx | packagejson | pegjs | pgsql | sh | sql | ssh-config | tsconfig) npx --yes --package prettier --package "prettier-plugin-$cmd" -- prettier "$@" ;;
    *) n prettier --write "**/*.js" "**/*.jsx" "**/*.ts" "**/*.tsx" "$@" ;;
    esac
    ;;

  qt) n qrcode-terminal "$@" ;;

  vercel) npx --yes vercel --token="${VERCEL_TOKEN:?}" "$@" ;;

  yo) n x --package yo --package "generator-$1" -- yo "$@" ;;

  x) npx --yes "$@" ;;

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
