#!/usr/bin/env sh

n() {
  cmd="$1"
  shift

  case $cmd in

  S) n start "$@" ;;

  agpl) n license AGPL-3.0 "$@" ;;

  b) n build "$@" ;;

  bs) n browser-sync "${@:-.}" --no-open ;;

  clear-npx-cache)
    find "$(npm config get cache)/_npx" -depth 2 -name 'package.json' | while IFS= read -r package; do
      if [ "$(jq -r '.dependencies | keys | first' <"$package")" = "${1:?}" ]; then
        echo >&2 + rm -fr "${package%/package.json}"
        rm -fr "${package%/package.json}"
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

  graphql-codegen) n x --package graphql --package @graphql-codegen/cli -- graphql-codegen "$@" ;;

  h) npm help "$@" ;;

  i)
    cmd="$1"
    shift
    case "$cmd" in
    @capacitor/app | expo-app | next-app | node-cli | nx-workspace | react-app | react-native-app) n i y "$cmd" -- "$@" ;;
    y) npm init --yes "$@" ;;
    *) npm install "$cmd" "$@" ;;
    esac
    ;;

  krampus)
    # Named after https://www.npmjs.com/package/krampus
    pid="$(lsof -ti "$*")"
    kill -TERM "$pid" || kill -KILL "$pid"
    ;;

  lpd) NPM_CONFIG_LEGACY_PEER_DEPS='1' "$@" ;;

  lv) NPM_CONFIG_LOGLEVEL='verbose' "$@" ;;

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
    init) echo {} >.prettierrc.json ;;
    awk | eex | elm | groovy | nginx | packagejson | pegjs | pgsql | sh | sql | ssh-config | tsconfig) n x --package prettier --package "prettier-plugin-$cmd" -- prettier "$@" ;;
    *) n prettier --write "**/*.js" "**/*.jsx" "**/*.ts" "**/*.tsx" "$@" ;;
    esac
    ;;

  qt) n qrcode-terminal "$@" ;;

  r) n run "$@" ;;

  vercel) n x vercel --token="${VERCEL_TOKEN:?}" "$@" ;;

  y) npx --yes "$@" ;;

  yo) n x --package yo --package "generator-$1" -- yo "$@" ;;

  *)
    if script="$(npm pkg get "scripts.$cmd" 2>/dev/null)" &&
      [ "$script" != '{}' ]; then
      npm run "$cmd" -- "$@"
      return
    fi

    case "$cmd" in
    @ionic/cli | @neutralinojs/neu | baapan | backstopjs | browser-sync | bundle-phobia | chance-cli | codesandbox | composerize | cost-of-modules | covgen | csv2json | cypress | degit | eslint | gitignore | jscodeshift | jscpd | knip | license | license-checker | lighthouse | mkcert | newman | nginx-linter | npkill | npm-check | npm-check-updates | npm-merge-driver | nve | nx | packagephobia-cli | pegjs | prettier | prettier-package-json | pwned | qnm | qrcode-terminal | react-native | readme-md-generator | resume-cli | selenium-side-runner | trello-cli | trucker | unimported | verdaccio | why-is-node-running | wait-on) n x "$cmd" "$@" ;;

    *) npm "$cmd" "$@" ;;
    esac
    ;;

  esac
}
